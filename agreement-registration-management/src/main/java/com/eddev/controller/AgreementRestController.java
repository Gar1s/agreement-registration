package com.eddev.controller;

import com.eddev.service.AgreementService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/admin/agreement")
@RequiredArgsConstructor
public class AgreementRestController {

    private final AgreementService agreementService;

    @GetMapping
    public ResponseEntity<Boolean> numerationExists(@RequestParam(name = "numeration") String numeration) {
        return ResponseEntity.ok(agreementService.isAgreementByNumerationExists(numeration));
    }

}
