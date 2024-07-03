package com.eddev.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
public class CompanyViewDto {

    private Long id;
    private String name;
    private String basis;
    private String position;
    private String initials;
    private String city;
    private String street;
    private String index;
    private List<Long> agreementIds;

}
