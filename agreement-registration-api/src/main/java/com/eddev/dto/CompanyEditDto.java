package com.eddev.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
@EqualsAndHashCode
public class CompanyEditDto {

    private String name;
    private String basis;
    private String position;
    private String initials;
    private String city;
    private String street;
    private String index;

}
