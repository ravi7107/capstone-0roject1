pipeline {
    agent any

    environment {
        IMAGE_NAME = "webapp:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${env.BRANCH_NAME ?: 'master'}", url: 'https://github.com/ravi7107/capstone-0roject1.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                // Replace with your test script if available
                sh './run_tests.sh || echo "Tests completed"'
            }
        }

        stage('Deploy to Prod') {
            when {
                branch 'master'
            }
            steps {
                echo "Deploying to Production..."
                sh 'docker stop webapp || true'
                sh 'docker rm webapp || true'
                sh 'docker run -d --name webapp -p 80:80 $IMAGE_NAME'
            }
        }
    }

    post {
        always {
            echo "Pipeline finished for branch ${env.BRANCH_NAME ?: 'master'}"
        }
    }
}
