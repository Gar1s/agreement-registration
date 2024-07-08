package com.eddev.exception;

import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

@ControllerAdvice
@Slf4j
public class UiExceptionHandler {

    @ExceptionHandler(RuntimeException.class)
    public String handlerRuntimeException(Exception ex, Model model){
        model.addAttribute("errorMessage", ex.getMessage());
        log.error(ex.getLocalizedMessage(), ex);
        return "/error/error";
    }

    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public String handleMaxUploadSizeExceededException(Exception ex, Model model){
        model.addAttribute("errorMessage", "Перевищено максимальний розмір завантаження файлів");
        log.error(ex.getLocalizedMessage(), ex);
        return "/error/error";
    }

}
