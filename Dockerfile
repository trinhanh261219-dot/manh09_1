# Sử dụng Tomcat base image
FROM tomcat:10.0-jdk21

# Xóa các file demo trong webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR đã build vào Tomcat
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
