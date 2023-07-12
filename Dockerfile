### Creo Container ECR ###
COPY src src
COPY pom.xml pom.xml
RUN mvn -f pom.xml clean package

#
# Package stage
#
FROM openjdk:8-jdk-alpine
ARG JAR_FILE
COPY --from=build /app/target/*.jar /usr/local/lib/products.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/products.jar"]
