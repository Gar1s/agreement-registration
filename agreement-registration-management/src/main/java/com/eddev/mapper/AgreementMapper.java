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

    @Mapping(target = "agreementDate", source = "company.agreementDate")
    @Mapping(target = "companyName", source = "company.name")
    AgreementDto toDto(Agreement agreement);

    @Mapping(target = "companyViewDto", source = "company")
    @Mapping(target = "fileId", source = "file.id")
    @Mapping(target = "fileName", source = "file.name")
    AgreementViewDto toViewDto(Agreement agreement);

    @Mapping(target = "company", source = "companyEditDto")
    void editFromEditDto(@MappingTarget Agreement agreement, AgreementEditDto dto);

}
