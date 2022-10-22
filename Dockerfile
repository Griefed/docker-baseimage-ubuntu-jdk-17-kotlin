FROM griefed/baseimage-ubuntu:2.1.12

ARG BUILD_DATE="Jun 28, 2021 7:44pm GMT+0200"
ARG VERSION="repocreation"
LABEL build_version="Git.Griefed.de version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Griefed <griefed@griefed.de>"
LABEL description="This image adds OpenJDK 17 JDK to griefed/baseimage-ubuntu."

RUN \
  echo "**** Update and install ****" && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y --no-install-recommends \
    ca-certificates \
    java-common \
    openjdk-17-jdk && \
  echo "# Setup JAVA_HOME variable" \
    >> /etc/bash.bashrc && \
  echo "source /etc/environment" \
    >> /etc/bash.bashrc && \
  curl -s https://get.sdkman.io | bash && \
  source "/root/.sdkman/bin/sdkman-init.sh" && \
  sdk install kotlin && \
  echo "**** Cleanup ****" && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/*

COPY root/ /
