package com.eddev.service;

import com.eddev.api.AgreementApi;
import com.eddev.domain.Agreement;
import com.eddev.domain.Company;
import com.eddev.domain.File;
import com.eddev.dto.AgreementCreateDto;
import com.eddev.dto.AgreementDto;
import com.eddev.dto.AgreementViewDto;
import com.eddev.mapper.AgreementMapper;
import com.eddev.repository.AgreementRepository;
import com.eddev.repository.CompanyRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AgreementService implements AgreementApi {

    private final AgreementRepository agreementRepository;
    private final CompanyRepository companyRepository;
    private final AgreementMapper agreementMapper;

    @Override
    public void save(AgreementCreateDto agreementCreateDto) {

        Company company = companyRepository.findById(agreementCreateDto.getCompanyId())
                .orElseThrow(() -> new EntityNotFoundException("Company not found"));

        Agreement agreement = new Agreement();
        agreement.setBasis(agreementCreateDto.getBasis());
        agreement.setPracticeType(agreementCreateDto.getPracticeType());
        agreement.setAgreementDate(agreementCreateDto.getAgreementDate());
        agreement.setStartDate(agreementCreateDto.getStartDate());
        agreement.setEndDate(agreementCreateDto.getEndDate());
        agreement.setStudentInitials(agreementCreateDto.getStudentInitials());
        agreement.setYear(agreementCreateDto.getYear());
        agreement.setSpeciality(agreementCreateDto.getSpeciality());
        agreement.setCompany(company);

        File file = new File();
        try {
            file.setName(agreementCreateDto.getFile().getOriginalFilename());
            file.setData(agreementCreateDto.getFile().getBytes());
            file.setType(agreementCreateDto.getFile().getContentType());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        agreement.setFile(file);

        agreementRepository.save(agreement);
    }

    @Override
    public List<AgreementDto> getAll() {
        return agreementRepository.findAll().stream()
                .map(agreementMapper::toDto)
                .toList();
    }

    @Override
    public AgreementViewDto viewById(Long id) {
        Agreement agreement = findById(id);
        return agreementMapper.toViewDto(agreement);
    }

    private Agreement findById(Long id){
        return agreementRepository.findById(id)
                .orElseThrow(()->new EntityNotFoundException("Agreement not found!"));
    }

}
