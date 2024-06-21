package com.eddev.service;

import com.eddev.api.CompanyApi;
import com.eddev.domain.Company;
import com.eddev.dto.CompanyCreateDto;
import com.eddev.mapper.CompanyMapper;
import com.eddev.repository.CompanyRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CompanyService implements CompanyApi {

    private final CompanyRepository companyRepository;
    private final CompanyMapper companyMapper;

    @Override
    public void save(CompanyCreateDto dto) {
        companyRepository.save(companyMapper.toEntityFromCreateDto(dto));
    }

    private Company findById(Long id){
        return companyRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Company not found"));
    }

}
