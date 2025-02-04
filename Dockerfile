#FROM jenkins/jenkins:2.346.2-jdk11
FROM jenkins/jenkins:2.400-jdk17

USER root
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -a -G docker jenkins
RUN apt-get update -y
# until we figure out how to run DinD on macOS without root...
RUN apt-get install sudo -y

USER jenkins


COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
