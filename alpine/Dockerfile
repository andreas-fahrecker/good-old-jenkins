FROM jenkins/jenkins:alpine

USER root
RUN addgroup --gid 281 docker
RUN addgroup jenkins docker

COPY --chown=jenkins:jenkins executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

# Install jenkins plugins
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
