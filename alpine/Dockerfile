FROM jenkins/jenkins:alpine-jdk21

USER root
RUN addgroup --gid 281 docker
RUN addgroup jenkins docker

# Install tea
RUN apk add --no-cache tea

COPY --chown=jenkins:jenkins executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

# Install jenkins plugins
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
