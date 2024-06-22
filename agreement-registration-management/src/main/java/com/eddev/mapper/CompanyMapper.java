package com.eddev.mapper;

import com.eddev.domain.Company;
import com.eddev.dto.CompanyCreateDto;
import com.eddev.dto.CompanyDto;
import com.eddev.dto.CompanyViewDto;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface CompanyMapper {

    Company toEntityFromCreateDto(CompanyCreateDto dto);

    CompanyViewDto toViewDto(Company company);

    CompanyDto toDto(Company company);

}
