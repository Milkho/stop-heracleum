# Stop Heracleum
###### See demo - [https://stop-heracleum.herokuapp.com](https://stop-heracleum.herokuapp.com/?lang=en) 
---
## Overview
__Stop Heracleum__ is a spring-based web application, designed to centralize the fight against [heracleum](https://en.wikipedia.org/wiki/Heracleum_(plant)).   
>Users help to make the map of heracleum's distribution by marking the places infected with the heracleum.   
This, in turn, will help local authorities to receive up-to-date data on contaminated sites and allow them to react promptly to new labels.

## Technologies

- Spring Framework 4.2.0.RELEASE
- Spring Security 4.2.3.RELEASE
- Spring Data JPA 1.8.2.RELEASE
- Hibernate 4.3.11.Final
- PostgreSQL 42.1.14
- Maven 3.3.9
- Bootstrap 3.3.7

## Running webapp locally  
To build application run:  

    mvn clean package   
    
And then run app using the java command:  

    java -jar target/dependency/webapp-runner.jar --expand-war target/*.war  
    
Access the deployed webapp at:

    http://localhost:8080  
    
## License
 Code released under the MIT License.
