FROM maven:latest as build
WORKDIR /app
COPY . .
RUN mvn clean package


FROM tomcat:8.5-jdk8
COPY --from=build /app/target/java-web-app*.war /usr/local/tomcat/webapps/java-web-app.war
