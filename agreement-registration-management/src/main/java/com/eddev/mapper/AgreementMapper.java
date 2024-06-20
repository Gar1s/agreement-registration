package com.eddev.mapper;

import com.eddev.domain.Agreement;
import com.eddev.dto.AgreementDto;
import com.eddev.dto.AgreementViewDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface AgreementMapper {

    @Mapping(target = "agreementDate", source = "company.agreementDate")
    @Mapping(target = "companyName", source = "company.name")
    AgreementDto toDto(Agreement agreement);

    @Mapping(target = "companyViewDto", source = "company")
    @Mapping(target = "fileId", source = "file.id")
    @Mapping(target = "fileName", source = "file.name")
    AgreementViewDto toViewDto(Agreement agreement);

}
