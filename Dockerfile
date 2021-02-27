FROM openjdk:8-jre-alpine
COPY spring-*.jar webapp.jar
EXPOSE 8080
CMD ["/usr/bin/java","-jar","-Dspring.profiles.active=default", "webapp.jar"]
