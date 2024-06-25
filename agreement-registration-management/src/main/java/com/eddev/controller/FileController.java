package com.eddev.controller;

import com.eddev.api.FileApi;
import com.eddev.dto.FileDto;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@RestController
@RequiredArgsConstructor
@RequestMapping("/admin/files")
public class FileController {

    private final FileApi fileApi;

    @GetMapping("/{id}")
    public ResponseEntity<byte[]> getById(@PathVariable Long id) {
        FileDto fileDto = fileApi.viewById(id);
        String filename = URLEncoder.encode(fileDto.getName(), StandardCharsets.UTF_8);

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "inline; filename='" + filename + "'")
                .contentType(MediaType.valueOf(fileDto.getType()))
                .body(fileDto.getData());
    }

}
