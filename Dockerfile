FROM tomcat:latest

LABEL maintainer="vinayaka8"

ADD ./webapp/target/webapp.war /usr/local/tomcat/webapps/webapp.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
