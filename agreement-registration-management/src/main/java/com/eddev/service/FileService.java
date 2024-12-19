package com.eddev.service;

import com.eddev.api.FileApi;
import com.eddev.domain.File;
import com.eddev.dto.FileDto;
import com.eddev.repository.FileRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
@RequiredArgsConstructor
public class FileService implements FileApi {

    @Value("${path.folder}")
    private String FOLDER_PATH;

    private final FileRepository fileRepository;

    @Override
    public FileDto viewById(String fileId) {
        File file = findById(fileId);
        String filePath = FOLDER_PATH + "/" + fileId;
        try {
            byte[] images = Files.readAllBytes(new java.io.File(filePath).toPath());
            FileDto fileDto = new FileDto();
            fileDto.setId(file.getId());
            fileDto.setName(file.getName());
            fileDto.setType(file.getType());
            fileDto.setData(images);
            return fileDto;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void storeFile(MultipartFile file, String fileId) {
        try {
            Path filePath = Paths.get(FOLDER_PATH + "/" + fileId);
            Files.createDirectories(Paths.get(FOLDER_PATH));
            Files.copy(file.getInputStream(), filePath);
        } catch (IOException e) {
            throw new RuntimeException("Не вдалося зберегти файл. Помилка: " + e.getMessage());
        }
    }

    @Override
    public void deleteById(String fileId) {
        try {
            Path path = Paths.get(FOLDER_PATH + "/" + fileId);
            Files.delete(path);
            fileRepository.deleteById(fileId);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private File findById(String id) {
        return fileRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Файл:" + id + " не знайдений!"));
    }

}
