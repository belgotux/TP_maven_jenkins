pipeline {
    agent {
        docker {
            image 'maven:3.9.3-eclipse-temurin-17'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Clean') {
            steps {
                sh 'mvn -B -DskipTests clean'
            }
        }
        stage('Package') {
            steps {
                sh 'mvn -B package'
            }
        }
        stage('Get App version') {
            steps {
                script {
                    def APP_VER = sh(script: 'mvn help:evaluate -Dexpression=project.version -q -DforceStdout 2>/dev/null', returnStdout: true)
                }
            }
        }
        stage('Build image') {
            steps {
                sh 'docker build -t ${env.APP_VER} --build-arg BUILD_VERSION=${env.APP_VER} .'
            }
        }
            

        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}

