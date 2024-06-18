package com.eddev;

import com.eddev.config.AgreementRegistrationApiConfig;
import com.eddev.config.AgreementRegistrationManagementConfig;
import com.eddev.config.AgreementRegistrationUiConfig;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

@Import({AgreementRegistrationManagementConfig.class,
        AgreementRegistrationUiConfig.class,
        AgreementRegistrationApiConfig.class})
@SpringBootApplication
public class AgreementRegistrationApplication {

    public static void main(String[] args) {
        SpringApplication.run(AgreementRegistrationApplication.class, args);
    }

}
