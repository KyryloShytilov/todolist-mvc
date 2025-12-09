FROM maven:3.8.8-eclipse-temurin-8 AS build
WORKDIR /app
COPY . .
RUN mvn install

FROM tomcat:7.0.72-jre8 
COPY --from=build todolist-web-servlet-jsp/target/todolist.war /usr/local/tomcat/webapps/ROOT.war