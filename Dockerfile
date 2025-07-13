#FROM openjdk:21-jdk-slim
#COPY build/libs/*.jar app.jar
#ENTRYPOINT ["java", "-jar", "/app.jar"]

FROM openjdk:21-jdk-slim
#ARG JAR_PATH
#
#ARG ACTIVE_PROFILE
#ENV ACTIVE_PROFILE $ACTIVE_PROFILE
ENV ENCODING "UTF-8"
ARG HEAP_MEMORY
ENV HEAP_MEMORY $HEAP_MEMORY
ARG VERSION_INFO
ENV VERSION $VERSION_INFO
ARG PORT_NUM
ENV PORT_NUM $PORT_NUM

#COPY "${JAR_PATH}" "/usr/local/lib/app.jar"
COPY build/libs/*.jar "/usr/local/lib/app.jar"

RUN echo ${VERSION} > /usr/local/lib/version
RUN cat /usr/local/lib/version

#ENTRYPOINT java -Dspring.profiles.active="${ACTIVE_PROFILE}" -Dfile.encoding="${ENCODING}" -Dserver.port=${PORT_NUM} -jar -Xms${HEAP_MEMORY}M -Xmx${HEAP_MEMORY}M /usr/local/lib/app.jar
ENTRYPOINT ["java",
         "-Dfile.encoding=${ENCODING}",
         "-Dserver.port=${PORT_NUM}",
         "-Xms${HEAP_MEMORY}M",
         "-Xmx${HEAP_MEMORY}M",
         "-jar",
         "/usr/local/lib/app.jar"
]