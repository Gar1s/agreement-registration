package com.eddev.api;

import com.eddev.dto.AgreementCreateDto;
import com.eddev.dto.AgreementDto;
import com.eddev.dto.AgreementViewDto;

import java.util.List;

public interface AgreementApi {

    void save(AgreementCreateDto agreementCreateDto);

    List<AgreementDto> getAll();

    AgreementViewDto viewById(Long id);

}
