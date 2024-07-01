package com.eddev.domain;

import com.eddev.constant.Basis;
import com.eddev.constant.PracticeType;
import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "agreements")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Agreement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Enumerated(value = EnumType.STRING)
    private Basis basis;
    @Enumerated(value = EnumType.STRING)
    private PracticeType practiceType;
    private LocalDate agreementDate;
    private LocalDate companyAgreementDate;
    private LocalDate startDate;
    private LocalDate endDate;
    private String studentInitials;
    private Integer year;
    private String speciality;

    @ToString.Exclude
    @OneToMany(mappedBy = "agreement", cascade = CascadeType.ALL)
    private List<File> files = new ArrayList<>();

    @ManyToOne
    @ToString.Exclude
    @JoinColumn(name = "company_id", referencedColumnName = "id")
    @JsonBackReference
    private Company company;

}
