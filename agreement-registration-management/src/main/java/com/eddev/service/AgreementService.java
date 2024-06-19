package com.eddev.service;

import com.eddev.AgreementMapper;
import com.eddev.api.AgreementApi;
import com.eddev.domain.Agreement;
import com.eddev.domain.File;
import com.eddev.dto.AgreementCreateDto;
import com.eddev.dto.AgreementDto;
import com.eddev.repository.AgreementRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AgreementService implements AgreementApi {

    private final AgreementRepository agreementRepository;
    private final AgreementMapper agreementMapper;

    @Override
    public void save(AgreementCreateDto agreementCreateDto) {
        Agreement agreement = new Agreement();
        agreement.setBasis(agreementCreateDto.getBasis());
        agreement.setPracticeType(agreementCreateDto.getPracticeType());
        agreement.setAgreementDate(agreementCreateDto.getAgreementDate());
        agreement.setStartDate(agreementCreateDto.getStartDate());
        agreement.setEndDate(agreementCreateDto.getEndDate());
        agreement.setStudentInitials(agreementCreateDto.getStudentInitials());
        agreement.setYear(agreementCreateDto.getYear());
        agreement.setSpeciality(agreementCreateDto.getSpeciality());

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

}
