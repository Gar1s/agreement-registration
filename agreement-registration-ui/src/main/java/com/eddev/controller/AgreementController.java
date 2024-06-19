package com.eddev.controller;

import com.eddev.api.AgreementApi;
import com.eddev.dto.AgreementCreateDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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

    @GetMapping("/form")
    public String get(){
        return "/admin/form";
    }

    @PostMapping
    public String post(@ModelAttribute AgreementCreateDto agreementCreateDto){
        agreementApi.save(agreementCreateDto);
        return "redirect:/admin/agreements";
    }

}
