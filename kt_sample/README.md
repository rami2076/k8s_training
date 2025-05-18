# kt_sample

## init

https://spring.pleiades.io/guides/tutorials/spring-boot-kotlin

```bash
curl https://start.spring.io/starter.zip \
  -d language=kotlin -d type=gradle-project-kotlin \
  -d dependencies=web,devtools \
  -d packageName=com.example.kt_sample \
  -d name=kt_sample \
  -o kt_sample.zip
unzip kt_sample.zip
rm kt_sample.zip
```

# Workaround

## Code insight unavailable related Gradle project not linked

https://stackoverflow.com/questions/77954295/gradle-kotlin-dsl-files-separate-config-files/77954564#77954564

- Add build.gradle.kt to Setting
- `./gradlew build`
- Restart.
- Finish.
- Fun to project.

# Ref

- https://hub.docker.com/_/openjdk
- https://blog.codersee.com/deploy-kotlin-spring-boot-app-with-mysql-on-kubernetes/
- https://zenn.dev/miketako3/articles/46b58307a64272
- https://www.techscore.com/blog/2019/02/28/springboot%E3%82%A2%E3%83%97%E3%83%AA%E3%82%92kubernetes%E3%81%A7%E4%BD%9C%E3%81%A3%E3%81%A6%E3%81%BF%E3%81%9F/
- https://www.baeldung.com/kotlin/docker-kubernetes-deploy-app
- https://github.com/oshai/kotlin-logging
- https://docs.docker.jp/engine/reference/commandline/build.html

# docker build image
```bash
docker build --tag kotlin-app .
# #confirm
docker images
# #run
docker run -p 127.0.0.1:8080:8080  kotlin-app
curl localhost:8080/echo
# #login
docker login
# #push image
export UNAME=sakusennx
docker tag kotlin-app:latest ${UNAME}/kotlin-app:latest
docker push ${UNAME}/kotlin-app:latest
```
