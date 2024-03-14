FROM jenkins/jenkins:latest

USER root
RUN groupadd -g 281 docker
RUN usermod -aG docker jenkins

COPY --chown=jenkins:jenkins executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

# Install jenkins plugins
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
