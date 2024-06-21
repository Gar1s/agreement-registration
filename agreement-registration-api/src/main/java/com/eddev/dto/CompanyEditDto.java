package com.eddev.dto;

import com.eddev.constant.Basis;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class CompanyEditDto {

    private String name;
    @Enumerated(value = EnumType.STRING)
    private Basis basis;
    private String position;
    private String initials;
    private LocalDate agreementDate;
    private String city;
    private String street;
    private String index;

}
