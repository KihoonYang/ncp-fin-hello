# Jib-maven Build
FROM docker.io/eclipse-temurin:11.0.19_7-jre-alpine
LABEL authors="devops"

# Container Run User
ARG USER_NAME=wasadmin
ARG GROUP_NAME=swgroup
ARG USER_UID=2003
ARG USER_GID=2000
RUN mkdir -p $USER_NAME \
  && chown ${USER_UID}:${USER_GID} $USER_NAME \
  && addgroup -g ${USER_GID} ${GROUP_NAME} \
  && adduser -h "$USER_NAME" -u ${USER_UID} -G ${GROUP_NAME} -s /bin/bash -D ${USER_NAME}

RUN echo "$USER_NAME:**********" | chpasswd


# CVE Vulnerability & TimeZone
RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/Asia/Seoul /etc/localtime && \
    echo "Asia/Seoul" > /etc/timezone

# Add & Set s/w library
#    apk add --no-cache libc6-compat && \
#    apk add --no-cache gcompat && \
#    apk add --no-cache libnsl && \
#    apk add --no-cache libstdc++6

#RUN ln -s /usr/lib/libnsl.so.3.0.0 /usr/lib/libnsl.so.1
#RUN ln -s /usr/lib/gcc/x86_64-alpine-linux-musl/6.4.0/libstdc++.so.6  /usr/lib/libstdc++.so.6
#RUN mkdir -p /app/petra/log

#RUN chown -R 2003:2000 /app/petra
#RUN chmod -R 775 /app/petra

#COPY --chown=2003:2000 dev/libpcjapi.so /usr/lib
#COPY --chown=2003:2000 dev/petra_cipher_api.conf /app/petra
#RUN chmod -R 755 /usr/lib/libpcjapi.so


# Run
CMD ["jshell"]
