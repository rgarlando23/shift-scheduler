pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'
        DOCKER_IMAGE_NAME = 'adriancuevas/shift-scheduler'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    def dockerImage = docker.build("${DOCKER_IMAGE_NAME}:latest")
                    docker.withRegistry('https://registry.hub.docker.com/', DOCKER_CREDENTIALS_ID) {
                    dockerImage.push('latest')
                    }
                }
            }
        }
    }
}
