package com.eddev.controller;

import com.eddev.dto.AgreementDto;
import com.eddev.service.ReportService;
import lombok.RequiredArgsConstructor;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/admin/reports")
public class ReportController {

    private final ReportService reportService;

    @PostMapping("/agreementExcel")
    public ResponseEntity<byte[]> generateAgreementsExcel(@RequestBody List<AgreementDto> request){
        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"));
        headers.setContentDispositionFormData("attachment", "agreements.xlsx");

        HSSFWorkbook book = reportService.generateAgreementsExcel(request);

        try {
            book.write(stream);
            book.close();
            stream.close();
        } catch (IOException e) {throw new RuntimeException(e);}
        return ResponseEntity.ok()
                .headers(headers)
                .body(stream.toByteArray());
    }

}
