package com.eddev.mapper;

import com.eddev.domain.File;
import com.eddev.dto.FileShortDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Mapper(componentModel = "spring")
public interface FileMapper {

    @Mapping(target = "name", source = "originalFilename")
    @Mapping(target = "data", source = "bytes")
    @Mapping(target = "type", source = "contentType")
    File toFile(MultipartFile multipartFile) throws IOException;

    FileShortDto toFileShortDto(File file);

}
