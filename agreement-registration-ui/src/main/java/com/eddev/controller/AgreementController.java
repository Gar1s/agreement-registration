package com.eddev.controller;

import com.eddev.api.AgreementApi;
import com.eddev.dto.AgreementCreateDto;
import com.eddev.dto.AgreementViewDto;
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
@RequestMapping("/admin/agreements")
public class AgreementController {

    private final AgreementApi agreementApi;

    @GetMapping
    public String getAll(Model model){
        model.addAttribute("list", agreementApi.getAll());
        return "admin/agreements";
    }

    @GetMapping("/create")
    public String getCreateForm(){
        return "admin/agreementForm";
    }

    @PostMapping
    public String create(@ModelAttribute AgreementCreateDto agreementCreateDto){
        agreementApi.save(agreementCreateDto);
        return "redirect:/admin/agreements";
    }

    @GetMapping("/{id}")
    public String getById(@PathVariable Long id, Model model){
        AgreementViewDto dto = agreementApi.viewById(id);
        model.addAttribute("agreement", dto);
        return "/admin/agreement";
    }

}
