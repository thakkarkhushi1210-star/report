FROM maven:3.9.6-eclipse-temurin-17 AS bulider
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM tomcate:10.1-jdk17
WORKDIR /usr/local/tomact/webapps/
COPY --from=builder /app/target/report-app-0.0.1-SNAPSHOT.war app.war
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.war"]


