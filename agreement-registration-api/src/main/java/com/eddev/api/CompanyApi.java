package com.eddev.api;

import com.eddev.dto.CompanyCreateDto;
import com.eddev.dto.CompanyDto;
import com.eddev.dto.CompanyEditDto;
import com.eddev.dto.CompanyViewDto;

import java.util.List;

public interface CompanyApi {

    void save(CompanyCreateDto dto);

    List<CompanyDto> getAll();

    CompanyViewDto viewById(Long id);

    void editById(Long id, CompanyEditDto dto);
}
