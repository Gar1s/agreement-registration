package com.eddev;

import com.eddev.domain.Agreement;
import com.eddev.dto.AgreementDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface AgreementMapper {

    @Mapping(target = "agreementDate", source = "company.agreementDate")
    @Mapping(target = "companyName", source = "company.name")
    AgreementDto toDto(Agreement agreement);

}
