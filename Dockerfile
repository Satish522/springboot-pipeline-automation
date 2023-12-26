From openjdk:17
EXPOSE 8080
ADD target/springboot-pipeline-automation.jar springboot-pipeline-automation.jar
ENTRYPOINT [ "java", "-jar", "springboot-pipeline-automation.jar" ]
