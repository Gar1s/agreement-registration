package com.eddev.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
public class AgreementDto {

    private Long id;
    private String practiceType;
    private LocalDate startDate;
    private LocalDate endDate;
    private String studentInitials;
    private String numeration;
    private LocalDate companyAgreementDate;
    private String companyName;
    private String companyId;

}
