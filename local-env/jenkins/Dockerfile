FROM jenkins/jenkins:lts-alpine

USER root
RUN apk add --no-cache docker
USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
