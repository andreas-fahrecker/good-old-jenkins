#!groovy

pipeline {
    agent {
        label 'linux'
    }

    stages {
        stage('Build/Push Docker Image') {
            when {
                beforeAgent true;
                branch 'main'
            }
            environment {
                DOCKER_HUB_CREDENTIALS = credentials('docker-hub-fah16145')
            }
            stages {
                stage('Login') {
                    steps {
                        sh 'docker login -u ${DOCKER_HUB_CREDENTIALS_USR} -p ${DOCKER_HUB_CREDENTIALS_PSW}'
                    }
                }
                stage('Build & Push') {
                    parallel {
                        stage('Default Image') {
                            stages {
                                stage('Build Default Image') {
                                    steps {
                                        sh 'docker build -t fah16145/good-old-jenkins:latest .'
                                    }
                                }
                                stage('Push Default Image') {
                                    steps {
                                        sh 'docker push fah16145/good-old-jenkins:latest'
                                    }
                                }
                            }
                        }                
                        stage('Alpine Image') {
                            stages {
                                stage('Build Alpine Image') {
                                    steps {
                                        sh 'docker build -t fah16145/good-old-jenkins:alpine alpine/'
                                    }
                                }
                                stage('Push Alpine Image') {
                                    steps {
                                        sh 'docker push fah16145/good-old-jenkins:alpine'
                                    }
                                }
                            }
                        }
                    }
                }
            }
            post {
                always {
                    sh 'docker logout'
                }
            }
        }
    }
}
