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

#### 2) Start project
```  
mvn clean install  
java <env variables: -DvariableName='value'> -jar <jar location>  
```

### Environment variables:
- ${URL} - url to database;
- ${USERNAME} - db username;
- ${PASSWORD} - db password;
- ${ADMIN_USERNAME} - admin username;
- ${ADMIN_PASSWORD} - admin password;
- ${BASE_URL} - base url of the host.

### UI COMPONENTS
* `Freemarker` as template engine
* `VueJs 3` as server rendering Framework
* `Boostrap 5.0+` as style Framework
* `FontAwesome` for icons