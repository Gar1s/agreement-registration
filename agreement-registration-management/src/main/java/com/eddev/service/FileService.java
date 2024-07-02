package com.eddev.service;

import com.eddev.api.FileApi;
import com.eddev.domain.File;
import com.eddev.dto.FileDto;
import com.eddev.repository.FileRepository;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class FileService implements FileApi{

    private final FileRepository fileRepository;

    @Override
    public FileDto viewById(Long id) {
        File file = findById(id);

        FileDto fileDto = new FileDto();
        fileDto.setId(file.getId());
        fileDto.setName(file.getName());
        fileDto.setType(file.getType());
        fileDto.setData(file.getData());

        return fileDto;
    }

    @Override
    public void deleteById(Long id) {
        fileRepository.deleteById(id);
    }

    private File findById(Long id){
        return fileRepository.findById(id)
                .orElseThrow(()-> new EntityNotFoundException("File not found!"));
    }

}
