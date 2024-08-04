package com.eddev.dto;

import com.eddev.constant.PracticeType;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.AccessLevel;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class AgreementEditDto {

    private String basis;
    @Enumerated(value = EnumType.STRING)
    private PracticeType practiceType;
    private LocalDate agreementDate;
    private LocalDate companyAgreementDate;
    private LocalDate startDate;
    private LocalDate endDate;
    private String studentInitials;
    private Integer year;
    private String speciality;
    @Setter(AccessLevel.NONE)
    private String numeration;
    private List<MultipartFile> documents;

    public void setNumeration(String numeration) {
        this.numeration = numeration.trim();
    }
}
