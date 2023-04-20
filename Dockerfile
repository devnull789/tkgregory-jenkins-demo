USER root
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -a -G docker jenkins
USER jenkins

#FROM jenkins/jenkins:2.346.2-jdk11
FROM jenkins/jenkins:2.400-jdk17

# Install plug-ins in this txt file...
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

# Do not run Jenkins Setup Wizard on first run...
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
