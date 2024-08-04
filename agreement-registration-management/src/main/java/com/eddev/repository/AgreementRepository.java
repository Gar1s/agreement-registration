package com.eddev.repository;

import com.eddev.domain.Agreement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AgreementRepository extends JpaRepository<Agreement, Long> {

    boolean existsByNumeration(String numeration);

}
