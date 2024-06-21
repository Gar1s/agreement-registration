package com.eddev.controller;

import com.eddev.api.CompanyApi;
import com.eddev.dto.CompanyCreateDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/companies")
public class CompanyController {

    private final CompanyApi companyApi;


    @GetMapping("/create")
    public String getCreateForm(){
        return "admin/companyCreateForm";
    }

    @PostMapping
    public String create(@ModelAttribute CompanyCreateDto dto) {
        companyApi.save(dto);
        return "redirect:/admin/companies";
    }

}
