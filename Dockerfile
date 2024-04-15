FROM jenkins/jenkins:latest

USER root
RUN groupadd -g 281 docker
RUN usermod -aG docker jenkins

# Install tea
RUN apt-get update && apt-get install -y git make golang
RUN git clone https://gitea.com/gitea/tea.git
RUN cd tea && make && make install

COPY --chown=jenkins:jenkins executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy

# Install jenkins plugins
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
