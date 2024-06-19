package com.eddev.dto;

import com.eddev.constant.Basis;
import com.eddev.constant.PracticeType;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
public class AgreementCreateDto {

    private Basis basis;
    private PracticeType practiceType;
    private LocalDate agreementDate;
    private LocalDate startDate;
    private LocalDate endDate;
    private String studentInitials;
    private Integer year;
    private String speciality;
    private MultipartFile file;

}
