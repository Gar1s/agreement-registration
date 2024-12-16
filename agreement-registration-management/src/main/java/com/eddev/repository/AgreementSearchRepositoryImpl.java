package com.eddev.repository;

import com.eddev.domain.Agreement;
import com.eddev.search.AgreementsSearchCriteria;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Expression;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class AgreementSearchRepositoryImpl implements AgreementSearchRepository {

    private final EntityManager entityManager;

    @Override
    public List<Agreement> findAllByCriteria(AgreementsSearchCriteria criteria) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Agreement> criteriaQuery = criteriaBuilder.createQuery(Agreement.class);
        List<Predicate> predicates = new ArrayList<>();
        // select from Agreements
        Root<Agreement> root = criteriaQuery.from(Agreement.class);

        if (!criteria.getSpeciality().isEmpty()) {
            Predicate namePred = criteriaBuilder.or(
                    criteriaBuilder.like(
                            criteriaBuilder.lower(root.get("speciality")),
                            "%" + criteria.getSpeciality().toLowerCase() + "%"
                    ),
                    criteriaBuilder.like(
                            criteriaBuilder.lower(root.get("numeration")),
                            "%" + criteria.getSpeciality().toLowerCase() + "%"
                    )
            );
            predicates.add(namePred);
        }

        if (!criteria.getDate().isEmpty()) {
            int year = Integer.parseInt(criteria.getDate());
            Predicate datePredicate = criteriaBuilder.equal(
                    criteriaBuilder.function("date_part",
                            Integer.class, criteriaBuilder.literal("YEAR"), root.get("companyAgreementDate")),
                    year
            );
            predicates.add(datePredicate);
        }
        if (!criteria.getPracticeType().isEmpty()) {
            Predicate typePred = criteriaBuilder.like(
                    criteriaBuilder.lower(root.get("practiceType")),
                    "%" + criteria.getPracticeType().toLowerCase() + "%"
            );
            predicates.add(typePred);
        }
        if (!criteria.getCompanyName().isEmpty()) {
            Predicate namePred = criteriaBuilder.like(
                    criteriaBuilder.lower(root.get("company").get("name")),
                    "%" + criteria.getCompanyName().toLowerCase() + "%"
            );
            predicates.add(namePred);
        }
        if (!criteria.getStudentInitials().isEmpty()) {
            Predicate initPred = criteriaBuilder.like(
                    criteriaBuilder.lower(root.get("studentInitials")),
                    "%" + criteria.getStudentInitials().toLowerCase() + "%"
            );
            predicates.add(initPred);
        }

        criteriaQuery.where(
                criteriaBuilder.and(predicates.toArray(new Predicate[0]))
        );

        Expression<String> numeration = root.get("numeration");
        Expression<Long> lastTwoDigits = criteriaBuilder.substring(numeration, 19).as(Long.class);
        Expression<Long> twoDigitsBeforeLastTwoDigits = criteriaBuilder.substring(numeration, 16, 2).as(Long.class);
        Expression<String> majorPart = criteriaBuilder.substring(numeration, 1, 16);

        criteriaQuery.orderBy(
                criteriaBuilder.asc(majorPart),
                criteriaBuilder.desc(twoDigitsBeforeLastTwoDigits),
                criteriaBuilder.asc(lastTwoDigits)
        );

        TypedQuery<Agreement> query = entityManager.createQuery(criteriaQuery);
        return query.getResultList();
    }

}
