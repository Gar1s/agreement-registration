package com.eddev.dto;

import com.eddev.constant.Basis;
import com.eddev.constant.PracticeType;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class AgreementViewDto {

    private Long id;
    @Enumerated(value = EnumType.STRING)
    private Basis basis;
    @Enumerated(value = EnumType.STRING)
    private PracticeType practiceType;
    private LocalDate agreementDate;
    private LocalDate companyAgreementDate;
    private LocalDate startDate;
    private LocalDate endDate;
    private String studentInitials;
    private Integer year;
    private String speciality;
    private CompanyDto companyDto;
    private List<FileShortDto> files = new ArrayList<>();

}
