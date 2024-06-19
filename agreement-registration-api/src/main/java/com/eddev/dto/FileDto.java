package com.eddev.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FileDto {

    private Long id;
    private String name;
    private String type;
    private byte[] data;

}
