 FROM openjdk:17-jdk-slim 

 COPY target/microservice-helloworld-0.0.1-SNAPSHOT.jar microservice-helloworld-0.0.1-SNAPSHOT.jar

 ENTRYPOINT ["java", "-jar", "/microservice-helloworld-0.0.1-SNAPSHOT.jar"]