FROM maven:3-jdk-8
LABEL Author="ramjagadeesh"
RUN git clone https://github.com/wakaleo/game-of-life.git && cd game-of-life && mvn clean package

FROM tomcat:8
LABEL author='Khaja'
COPY --from=mvn /webapp/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
EXPOSE 8080
CMD ["catalina.sh", "run"]