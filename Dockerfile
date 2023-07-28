FROM jenkins/ssh-agent:jdk11
USER jenkins
ARG BUILD_VERSION
COPY target/my-app-${BUILD_VERSION}.jar my-app-${BUILD_VERSION}.jar 
ENTRYPOINT ["java","-jar my-app-${BUILD_VERSION}.jar"]