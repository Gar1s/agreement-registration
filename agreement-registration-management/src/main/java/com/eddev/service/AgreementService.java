package com.eddev.service;

import com.eddev.api.AgreementApi;
import com.eddev.api.FileApi;
import com.eddev.domain.Agreement;
import com.eddev.domain.Company;
import com.eddev.domain.File;
import com.eddev.dto.AgreementCreateDto;
import com.eddev.dto.AgreementDto;
import com.eddev.dto.AgreementEditDto;
import com.eddev.dto.AgreementViewDto;
import com.eddev.mapper.AgreementMapper;
import com.eddev.mapper.FileMapper;
import com.eddev.repository.AgreementRepository;
import com.eddev.repository.AgreementSearchRepository;
import com.eddev.repository.CompanyRepository;
import com.eddev.search.AgreementsSearchCriteria;
import jakarta.persistence.EntityExistsException;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class AgreementService implements AgreementApi {

    private final AgreementRepository agreementRepository;
    private final AgreementSearchRepository searchRepository;
    private final CompanyRepository companyRepository;
    private final AgreementMapper agreementMapper;
    private final FileMapper fileMapper;
    private final FileApi fileApi;

    @Override
    public void save(AgreementCreateDto dto) {
        if (agreementRepository.existsByNumeration(dto.getNumeration())) {
            throw new EntityExistsException("Угода за таким номером: " + dto.getNumeration() + " існує!");
        }
        Company company = companyRepository.findById(dto.getCompanyId())
                .orElseThrow(() -> new EntityNotFoundException("Company not found"));

        Agreement agreement = new Agreement();
        agreement.setBasis(dto.getBasis());
        agreement.setPracticeType(dto.getPracticeType());
        agreement.setAgreementDate(dto.getAgreementDate());
        agreement.setCompanyAgreementDate(dto.getCompanyAgreementDate());
        agreement.setStartDate(dto.getStartDate());
        agreement.setEndDate(dto.getEndDate());
        agreement.setStudentInitials(dto.getStudentInitials());
        agreement.setYear(dto.getYear());
        agreement.setSpeciality(dto.getSpeciality());
        agreement.setNumeration(dto.getNumeration());
        agreement.setCompany(company);

        List<File> files = dto.getFiles().stream()
                .map(file -> storeFile(file, agreement))
                .toList();

        agreement.setFiles(files);

        agreementRepository.save(agreement);
    }

    @Transactional(readOnly = true)
    @Override
    public List<AgreementDto> getAll(AgreementsSearchCriteria criteria) {
        return searchRepository.findAllByCriteria(criteria).stream()
                .map(agreementMapper::toDto)
                .toList();
    }

    @Transactional
    @Override
    public AgreementViewDto viewById(Long id) {
        Agreement agreement = findById(id);
        AgreementViewDto dto = agreementMapper.toViewDto(agreement);
        dto.setFiles(agreement.getFiles().stream()
                .map(fileMapper::toFileShortDto)
                .toList()
        );
        return dto;
    }

    @Transactional
    @Override
    public void editById(Long id, AgreementEditDto dto) {
        Agreement agreement = findById(id);
        if (!agreement.getNumeration().equals(dto.getNumeration())){
            if (agreementRepository.existsByNumeration(dto.getNumeration())) {
                throw new EntityExistsException("Угода за таким номером: " + dto.getNumeration() + " існує!");
            }
        }
        agreementMapper.editFromEditDto(agreement, dto);

        if (!dto.getDocuments().get(0).isEmpty()) {
            List<File> files = new ArrayList<>(dto.getDocuments().stream()
                    .map(file -> storeFile(file, agreement))
                    .toList());
            files.addAll(agreement.getFiles());
            agreement.setFiles(files);
        }

        agreementRepository.save(agreement);
    }

    @Override
    public boolean isAgreementByNumerationExists(String numeration) {
        return agreementRepository.existsByNumeration(numeration);
    }

    @Transactional
    @Override
    public void deleteById(Long id) {
        Agreement agreement = findById(id);
        agreement.getFiles()
                .forEach(file -> fileApi.deleteById(file.getId()));
        agreementRepository.deleteById(id);
    }

    private File storeFile(MultipartFile multipartFile, Agreement agreement) {
        try {
            File file = fileMapper.toFile(multipartFile);
            String fileId = UUID.randomUUID().toString().concat(".").concat(multipartFile.getOriginalFilename());

            fileApi.storeFile(multipartFile, fileId);

            file.setId(fileId);
            file.setAgreement(agreement);
            return file;
        } catch (IOException e) {
            throw new RuntimeException("Failed to process file: " + multipartFile.getOriginalFilename(), e);
        }
    }

    private Agreement findById(Long id) {
        return agreementRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Agreement not found!"));
    }

}
