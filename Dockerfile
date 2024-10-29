FROM maven:latest as build

WORKDIR /build

COPY . .
RUN mvn clean install package

FROM tomcat:8 as runtime

COPY --from=build /build/target/showcase-8.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080