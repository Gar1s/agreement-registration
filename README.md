# Agreement Registration(Spring MVC, Freemarker)
This is project about agreement registration.

## Structure

#### Application
* Java 17
* Maven
* Spring Security 6.0+

#### Database
* PostgreSQL

## Setting up a project
#### 1) Clone the repository
```  
git clone https://github.com/Gar1s/agreement-registration.git
cd agreement-registration
```

#### 2) Build project
```  
mvn clean install or 
mvn clean package  
```

#### 3) Start project
```  
java <env variables: -DvariableName='value'> -jar <jar location>  
```
For this project(add .evn to the project and just start it):
```
java -jar agreement-registration-app/target/agreementregistrationapp-2.1.0.jar
```

### Environment variables:
- ${DB_URL} - Database full url(jdbc:postgresql://localhost:5432/AgreementRegistration);
- ${DB_USERNAME} - Database username;
- ${DB_PASSWORD} - Database password;
- ${ADMIN_USERNAME} - Admin username;
- ${ADMIN_PASSWORD} - Admin password;
- ${APP_URL} - App full url(http://localhost:8080).
- ${PORT} - Server port.
- ${FILES_FOLDER} - Path to files (C:/agreements_files)

  For deploy:
- ${LANG} - Specifying a locale(en_US.UTF-8).

### UI COMPONENTS
* `Freemarker` as template engine
* `VueJs 3` as server rendering Framework
* `Boostrap 5.0+` as style Framework
* `FontAwesome` for icons