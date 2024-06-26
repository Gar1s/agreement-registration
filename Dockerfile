FROM maven:3.8.5-openjdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim
COPY --from=build agreement-registration-api/target/agreement-registration-api-2.1.0.jar agreement-registration-api.jar
COPY --from=build agreement-registration-app/target/agreementregistrationapp-2.1.0.jar agreementregistrationapp.jar
COPY --from=build agreement-registration-common/target/agreementregistrationcommon-2.1.0.jar agreementregistrationcommon.jar
COPY --from=build agreement-registration-management/target/agreementregistrationmanagement-2.1.0.jar agreementregistrationmanagement.jar
COPY --from=build agreement-registration-ui/target/agreement-registration-ui-2.1.0.jar agreement-registration-ui.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "agreementregistrationapp.jar"]