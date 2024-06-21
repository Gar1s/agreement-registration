package com.eddev.config;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@EntityScan("com.eddev.domain")
@ComponentScan("com.eddev")
@EnableJpaRepositories("com.eddev.repository")
public class AgreementRegistrationManagementConfig {
}
