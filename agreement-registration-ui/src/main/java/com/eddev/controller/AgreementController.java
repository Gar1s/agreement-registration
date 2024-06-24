package com.eddev.controller;

import com.eddev.api.AgreementApi;
import com.eddev.dto.AgreementCreateDto;
import com.eddev.dto.AgreementEditDto;
import com.eddev.dto.AgreementViewDto;
import com.eddev.search.AgreementsSearchCriteria;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/agreements")
public class AgreementController {

    private final AgreementApi agreementApi;

    @GetMapping
    public String getAll(Model model,
                         @RequestParam(required = false, defaultValue = "") String date,
                         @RequestParam(required = false, defaultValue = "") String type,
                         @RequestParam(required = false, defaultValue = "") String companyName
    ) {
        AgreementsSearchCriteria criteria = AgreementsSearchCriteria.builder()
                .date(date).practiceType(type).companyName(companyName).build();
        Map<String, Object> params = new HashMap<>();
        params.put("searchDate", date);
        params.put("searchPracticeType", type);
        params.put("searchCompanyName", companyName);
        model.addAttribute("list", agreementApi.getAll(criteria));
        model.addAttribute("params", params);
        return "admin/agreements";
    }

    @GetMapping("/create")
    public String getCreateForm() {
        return "admin/agreementCreateForm";
    }

    @GetMapping("/{id}/edit")
    public String getEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("agreement", agreementApi.viewById(id));
        return "admin/agreementEditForm";
    }

    @PostMapping("/{id}/edit")
    public String edit(@PathVariable Long id, @ModelAttribute AgreementEditDto dto) {
        agreementApi.editById(id, dto);
        return "redirect:/admin/agreements/" + id;
    }

    @PostMapping
    public String create(@ModelAttribute AgreementCreateDto agreementCreateDto) {
        agreementApi.save(agreementCreateDto);
        return "redirect:/admin/agreements";
    }

    @GetMapping("/{id}")
    public String getById(@PathVariable Long id, Model model) {
        AgreementViewDto dto = agreementApi.viewById(id);
        model.addAttribute("agreement", dto);
        return "/admin/agreement";
    }

    @PostMapping("/{id}/delete")
    public String delete(@PathVariable Long id) {
        agreementApi.deleteById(id);
        return "redirect:/admin/agreements";
    }

}
