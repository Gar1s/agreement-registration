package com.eddev.dto;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.stream.Collectors;

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
    @Setter(AccessLevel.NONE)
    private Map<Long, String> agreementIds = new HashMap<>();

    public void setAgreementIds(Map<Long, String> agreementIds) {
        this.agreementIds = agreementIds.entrySet()
                .stream()
                .sorted((entry1, entry2) -> {
                    String value1 = entry1.getValue();
                    String value2 = entry2.getValue();

                    String[] parts1 = value1.split("/");
                    String[] parts2 = value2.split("/");

                    // Extract and compare the first parts in desc
                    int comparison = Integer.compare(
                            Integer.parseInt(parts2[3].split("-")[0]),
                            Integer.parseInt(parts1[3].split("-")[0])
                    );
                    if (comparison == 0) { // If first parts are equal, compare the second parts
                        comparison = Integer.compare(
                                Integer.parseInt(parts1[3].split("-")[1]),
                                Integer.parseInt(parts2[3].split("-")[1])
                        );
                    }
                    return comparison;

                })
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        Map.Entry::getValue,
                        (existing, replacement) -> existing,
                        LinkedHashMap::new
                ));
    }
}
