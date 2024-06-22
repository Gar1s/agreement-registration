package com.eddev.dto;

import com.eddev.constant.Basis;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CompanyCreateDto {

    private String name;
    @Enumerated(value = EnumType.STRING)
    private Basis basis;
    private String position;
    private String initials;
    private String city;
    private String street;
    private String index;

}
