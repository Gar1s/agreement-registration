package com.eddev.api;

import com.eddev.dto.AgreementCreateDto;
import com.eddev.dto.AgreementDto;
import com.eddev.dto.AgreementEditDto;
import com.eddev.dto.AgreementViewDto;
import com.eddev.search.AgreementsSearchCriteria;

import java.util.List;

public interface AgreementApi {

    void save(AgreementCreateDto agreementCreateDto);

    List<AgreementDto> getAll(AgreementsSearchCriteria criteria);

    AgreementViewDto viewById(Long id);

    void deleteById(Long id);

    void editById(Long id, AgreementEditDto dto);

    boolean isAgreementByNumerationExists(String numeration);

}
