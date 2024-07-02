package com.eddev.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CompanyCreateDto {

    private String name;
    private String basis;
    private String position;
    private String initials;
    private String city;
    private String street;
    private String index;

}
