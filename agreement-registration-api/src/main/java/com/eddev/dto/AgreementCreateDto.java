package com.eddev.dto;

import com.eddev.constant.PracticeType;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class AgreementCreateDto {

    private Long companyId;
    private String basis;
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
    private List<MultipartFile> files = new ArrayList<>();

    public void setNumeration(String numeration) {
        this.numeration = numeration.trim();
    }
}
