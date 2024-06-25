package com.eddev.controller;

import com.eddev.api.CompanyApi;
import com.eddev.dto.CompanyCreateDto;
import com.eddev.dto.CompanyEditDto;
import com.eddev.dto.CompanyViewDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/companies")
public class CompanyController {

    private final CompanyApi companyApi;


    @GetMapping
    public String getAll(Model model) {
        model.addAttribute("list", companyApi.getAll());
        return "admin/companies";
    }

    @GetMapping("/create")
    public String getCreateForm() {
        return "admin/companyCreateForm";
    }

    @PostMapping
    public String create(@ModelAttribute CompanyCreateDto dto) {
        companyApi.save(dto);
        return "redirect:/admin/companies";
    }

    @GetMapping("/{id}")
    public String getById(@PathVariable Long id, Model model) {
        CompanyViewDto dto = companyApi.viewById(id);
        model.addAttribute("company", dto);
        return "admin/company";
    }

    @GetMapping("/{id}/edit")
    public String getEditForm(@PathVariable Long id, Model model) {
        CompanyViewDto dto = companyApi.viewById(id);
        model.addAttribute("company", dto);
        return "admin/companyEditForm";
    }

    @PostMapping("/{id}/edit")
    public String edit(@PathVariable Long id, @ModelAttribute CompanyEditDto dto) {
        companyApi.editById(id, dto);
        return "redirect:/admin/companies/" + id;
    }

    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id) {
        companyApi.deleteById(id);
        return "redirect:/admin/companies";
    }


}
