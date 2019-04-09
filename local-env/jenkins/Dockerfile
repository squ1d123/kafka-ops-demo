FROM jenkins/jenkins:2.171-alpine

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
USER root
RUN apk add --no-cache docker
USER jenkins
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
