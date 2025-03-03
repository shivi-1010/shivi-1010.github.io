pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/shivi-1010/shivi-1010.github.io.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t myportfolio .
                '''
            }
        }
        stage('Push to Staging') {
            steps {
                sh '''
                scp -o StrictHostKeyChecking=no docker-compose.yml ubuntu@3.16.75.19:/home/ubuntu/
                ssh -o StrictHostKeyChecking=no ubuntu@3.16.75.19 "docker-compose up -d"
                '''
            }
        }
        stage('Deploy to Production') {
            steps {
                input "Deploy to Production?"
                sh '''
                scp -o StrictHostKeyChecking=no docker-compose.yml ubuntu@3.135.203.204:/home/ubuntu/
                ssh -o StrictHostKeyChecking=no ubuntu@3.135.203.204 "docker-compose up -d"
                '''
            }
        }
    }
}
