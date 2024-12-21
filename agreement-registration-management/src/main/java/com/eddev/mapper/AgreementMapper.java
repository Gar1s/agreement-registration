package com.eddev.mapper;

import com.eddev.domain.Agreement;
import com.eddev.dto.AgreementDto;
import com.eddev.dto.AgreementEditDto;
import com.eddev.dto.AgreementViewDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.MappingTarget;

@Mapper(componentModel = "spring")
public interface AgreementMapper {

    @Mapping(target = "companyName", source = "company.name")
    @Mapping(target = "companyId", source = "company.id")
    @Mapping(target = "companyInitials", source = "company.initials")
    AgreementDto toDto(Agreement agreement);

    @Mapping(target = "companyDto", source = "company")
    @Mapping(target = "files", ignore = true)
    AgreementViewDto toViewDto(Agreement agreement);


    void editFromEditDto(@MappingTarget Agreement agreement, AgreementEditDto dto);

}
