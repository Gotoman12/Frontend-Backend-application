FROM eclipse-temurin:17-jdk-alpine-3.23
WORKDIR /arjun
COPY . /arjun
EXPOSE 8086
CMD [ "java","-jar","target/mechyam-backend-0.0.1-SNAPSHOT.jar" ]