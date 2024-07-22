package com.eddev.dto;

import com.eddev.constant.PracticeType;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@NoArgsConstructor
public class AgreementDto {

    private Long id;
    @Enumerated(value = EnumType.STRING)
    private PracticeType practiceType;
    private LocalDate startDate;
    private LocalDate endDate;
    private String studentInitials;
    private String numeration;
    private LocalDate companyAgreementDate;
    private String companyName;
    private String companyId;

}
