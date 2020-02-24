FROM tomcat:8
LABEL Author="ramjagadeesh"
RUN wget https://github.com/QT-DevOps/DevOpsIssues/files/2130588/gameoflife.zip && apt install unzip -y && unzip gameoflife.zip && mv gameoflife.war /usr/local/tomcat/webapps
# VOLUME /usr/local/tomcat
EXPOSE 8080
CMD ["catalina.sh", "run"]