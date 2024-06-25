package com.eddev.service;

import com.eddev.api.CompanyApi;
import com.eddev.domain.Agreement;
import com.eddev.domain.Company;
import com.eddev.dto.CompanyCreateDto;
import com.eddev.dto.CompanyDto;
import com.eddev.dto.CompanyEditDto;
import com.eddev.dto.CompanyViewDto;
import com.eddev.mapper.CompanyMapper;
import com.eddev.repository.CompanyRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CompanyService implements CompanyApi {

    private final CompanyRepository companyRepository;
    private final CompanyMapper companyMapper;

    @Override
    public void save(CompanyCreateDto dto) {
        companyRepository.save(companyMapper.toEntityFromCreateDto(dto));
    }

    @Override
    public List<CompanyDto> getAll() {
        return companyRepository.findAll().stream()
                .map(companyMapper::toDto)
                .toList();
    }

    @Transactional(readOnly = true)
    @Override
    public CompanyViewDto viewById(Long id) {
        Company company = findById(id);
        CompanyViewDto dto = companyMapper.toViewDto(company);
        dto.setAgreementIds(company.getAgreements().stream()
                .map(Agreement::getId)
                .toList()
        );
        return dto;
    }

    @Override
    public void editById(Long id, CompanyEditDto dto) {
        Company company = findById(id);
        company.setName(dto.getName());
        company.setBasis(dto.getBasis());
        company.setPosition(dto.getPosition());
        company.setInitials(dto.getInitials());
        company.setCity(dto.getCity());
        company.setStreet(dto.getStreet());
        company.setIndex(dto.getIndex());
        companyRepository.save(company);
    }

    @Override
    public void deleteById(Long id) {
        companyRepository.deleteById(id);
    }

    private Company findById(Long id) {
        return companyRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Company not found"));
    }

}
