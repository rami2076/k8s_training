FROM openjdk:17
# https://hub.docker.com/_/openjdk
LABEL authors="sakusennx"

WORKDIR /work
COPY ./build/libs/kt_sample-0.0.1-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "/work/app.jar"]
