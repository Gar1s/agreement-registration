package com.eddev.search;

import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class AgreementsSearchCriteria {

    private String date;
    @Enumerated(value = EnumType.STRING)
    private String practiceType;
    private String companyName;

}
