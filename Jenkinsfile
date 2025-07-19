pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-app"
        DOCKER_CONTAINER = "my-app-container"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/sameerkbiswas/jenkins-pipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Stop and Remove Old Container') {
            steps {
                script {
                    // Stop and remove any old container
                    sh 'docker stop $DOCKER_CONTAINER || true'
                    sh 'docker rm $DOCKER_CONTAINER || true'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run a new container from the image
                    sh 'docker run -d -p 82:80 --name $DOCKER_CONTAINER $DOCKER_IMAGE'
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Optional cleanup (remove unused images/containers)
                    sh 'docker system prune -f'
                }
            }
        }
    }

    /*post {
        always {
            cleanWs()  // Clean workspace after each build
        }
    }*/
}
