package com.eddev.domain;


import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "files")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class File {

    @Id
    private String id;
    private String name;
    private String type;

    @ManyToOne
    @JoinColumn(name = "agreement_id", referencedColumnName = "id")
    private Agreement agreement;

}
