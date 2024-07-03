package com.eddev.api;

import com.eddev.dto.FileDto;


public interface FileApi {

    FileDto viewById(Long id);

    void deleteById(Long id);

}
