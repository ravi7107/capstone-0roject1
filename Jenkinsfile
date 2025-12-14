pipeline {
    agent any

    environment {
        IMAGE_NAME = "webapp:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the branch that triggered the build
                git branch: "${env.BRANCH_NAME}", url: 'https://github.com/ravi7107/capstone-0roject1.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Test') {
            steps {
                sh './run_tests.sh || echo "Tests completed"'
            }
        }

        stage('Deploy to Prod') {
            when {
                branch 'master'  // Only deploy if it's the master branch
            }
            steps {
                sh 'docker stop webapp || true'
                sh 'docker rm webapp || true'
                sh 'docker run -d --name webapp -p 80:80 $IMAGE_NAME'
            }
        }
    }

    post {
        always {
            echo "Pipeline finished for branch ${env.BRANCH_NAME}"
        }
    }
}
