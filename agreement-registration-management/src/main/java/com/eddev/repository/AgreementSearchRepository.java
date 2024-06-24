package com.eddev.repository;

import com.eddev.domain.Agreement;
import com.eddev.search.AgreementsSearchCriteria;

import java.util.List;

public interface AgreementSearchRepository {

    List<Agreement> findAllByCriteria(AgreementsSearchCriteria criteria);

}
