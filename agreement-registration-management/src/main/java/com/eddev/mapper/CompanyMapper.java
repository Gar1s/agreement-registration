package com.eddev.mapper;

import com.eddev.domain.Company;
import com.eddev.dto.CompanyCreateDto;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface CompanyMapper {

    Company toEntityFromCreateDto(CompanyCreateDto dto);

}
