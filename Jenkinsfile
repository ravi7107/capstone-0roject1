pipeline {
    agent any

    environment {
        IMAGE_NAME = "webapp:latest"
        APP_REPO   = "https://github.com/hshar/website.git"
    }

    stages {

        stage('Checkout Application Code') {
            steps {
                dir('app') {
                    git branch: 'master', url: "${APP_REPO}"
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                dir('app') {
                    sh '''
                    docker build -t ${IMAGE_NAME} .
                    '''
                }
            }
        }

        stage('Test') {
            steps {
                echo "Running basic container test"
                sh '''
                docker run --rm ${IMAGE_NAME} echo "Container test successful"
                '''
            }
        }

        stage('Deploy to Prod') {
            when {
                branch 'master'
            }
            steps {
                sh '''
                docker stop webapp || true
                docker rm webapp || true
                docker run -d --name webapp -p 80:80 ${IMAGE_NAME}
                '''
            }
        }
    }

    post {
        always {
            echo "Pipeline finished for branch: ${env.BRANCH_NAME}"
        }
    }
}
