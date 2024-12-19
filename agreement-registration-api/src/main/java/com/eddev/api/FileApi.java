package com.eddev.api;

import com.eddev.dto.FileDto;
import org.springframework.web.multipart.MultipartFile;


public interface FileApi {

    FileDto viewById(String id);

    void deleteById(String id);

    void storeFile(MultipartFile file, String fileId);

}
