# Microservicio Hello World - Spring Boot + Docker

Este repositorio contiene la resolución del laboratorio de creación de un microservicio básico utilizando Spring Boot y Docker, con configuración y despliegue en entornos cloud mediante GitHub Codespaces y Play with Docker.

## Objetivo

Desarrollar un microservicio REST que responda con el mensaje `"Hello, World!"`, contenerizarlo usando Docker, y desplegarlo en un entorno de pruebas en la nube.

## Tecnologías y Herramientas

- **Lenguaje:** Java 17  
- **Framework:** Spring Boot  
- **Gestor de dependencias:** Maven  
- **Contenerización:** Docker  
- **Entorno de desarrollo:** GitHub Codespaces  
- **Plataforma de despliegue:** Play with Docker  
- **DevContainer:** `.devcontainer/devcontainer.json` para entorno reproducible

## Estructura General

```
hello-world-microservice/
├── .devcontainer/
│   └── devcontainer.json
├── src/
│   └── main/
│       └── java/
│           └── com/
│               └── eci/
│                   └── arcn/
│                       └── helloworld/
│                           └── HelloWorldController.java
├── Dockerfile
├── pom.xml
└── README.md
```

## Componentes Clave

### `HelloWorldController.java`

Implementa el endpoint `GET /hello` usando Spring Web. Anotado con `@RestController` y `@GetMapping`.

```java
@GetMapping("/hello")
public String hello() {
    return "Hello, World!";
}
```

### `Dockerfile`

Imagen basada en `openjdk:17-jdk-slim`. Empaqueta y ejecuta el archivo `.jar` generado por Maven.

```dockerfile
FROM openjdk:17-jdk-slim
COPY target/microservice-helloworld.jar microservice-helloworld.jar
ENTRYPOINT ["java", "-jar", "/microservice-helloworld.jar"]
```

### `devcontainer.json`

Define el entorno de desarrollo reproducible para GitHub Codespaces, incluyendo soporte para Java, Maven y Docker-in-Docker. Ejecuta `mvn clean install` tras la creación del contenedor.

## Flujo de Trabajo

1. **Inicialización del repositorio** en GitHub y configuración del entorno de desarrollo con DevContainers.
2. **Generación del proyecto** con Spring Initializr y adición de la dependencia `spring-boot-starter-web`.
3. **Desarrollo del controlador** REST `HelloWorldController`.
4. **Compilación del proyecto** con Maven (`mvn clean package`).
5. **Construcción de la imagen Docker** del microservicio.
6. **Subida de la imagen** al registro de Docker Hub utilizando autenticación mediante Personal Access Token.
7. **Despliegue del contenedor** en Play with Docker para validación del funcionamiento en un entorno remoto.

## Play with Docker
![image](https://github.com/user-attachments/assets/c2025383-5f84-4338-83ce-867e076b7e25)
![image](https://github.com/user-attachments/assets/ce5220fa-226e-4978-8f7f-628ff3d4393b)



## Observaciones

- El proyecto sigue una estructura estándar para servicios Spring Boot empacados como JAR ejecutables.
- La imagen Docker es portable y puede ser desplegada en cualquier entorno compatible con Docker sin necesidad de configuraciones adicionales.

## Autor

Julisns Briceño
