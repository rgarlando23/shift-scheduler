pipeline {
    agent {
        label "docker"
    }
    environment {
        DOCKER_CREDENTIALS_ID = 'docker-hub-credentials'
        DOCKER_IMAGE_NAME = 'adriancuevas/shift-scheduler'
    }
    
    stages {
        stage('Build and Push Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    def dockerImage = docker.build("${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}")
                    
                    // Push the Docker image
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_CREDENTIALS_ID) {
                        dockerImage.push("${BUILD_NUMBER}")
                        dockerImage.tag('latest')
                        dockerImage.push('latest')
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                withKubeConfig(caCertificate: "${KUBE_CERT}", 
                                clusterName: 'kubernetes',
                                contextName: 'kubernetes-admin@kubernetes',
                                credentialsId: 'my-kube-config-credentials',
                                namespace: 'default',
                                restrictKubeConfigAccess: false,
                                serverUrl: 'https://jump-host:6443') {
                    sh "sed -i 's#<image>#${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}#g' depl/deployment.yaml"
                    sh '''
                    if ! kubectl get namespace production; then
                        kubectl create namespace production
                    fi '''
                    sh 'kubectl apply -f depl/volume.yaml'
                    sh 'kubectl apply -f depl/deployment.yaml'
                    sh 'kubectl apply -f depl/service.yaml'
                    sh ''
                }
            }
        }    
    }
}