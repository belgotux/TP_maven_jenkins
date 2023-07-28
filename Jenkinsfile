pipeline {
    agent any
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
                echo "version app : ${env.APP_VER}"
            }
        }
        stage('Build image') {
            steps {
                sh 'docker build -t ${env.APP_VER} --build-arg BUILD_VERSION=${env.APP_VER} .'
            }
        }
            

        stage('publish image docker hub') {
            steps {
                echo 'publish'
            }
        }
    }
}

