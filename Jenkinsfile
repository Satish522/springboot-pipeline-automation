pipeline {
    agent any
    tools{
        maven 'Maven'
    }
    stages {
        stage('Maven Build') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Satish522/springboot-pipeline-automation.git']])
                sh 'mvn clean install'
            }
        }
        stage('Docker Build') {
            steps{
                script {
                    sh  'docker build -t satish2121/springboot-pipeline-automation .'
                }
            }
        }
        stage('Publish Image to Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhubcredential', variable: 'dockerhubcredential')]) {
                    sh 'docker login -u satish2121 -p ${dockerhubcredential}'
                }
                sh 'docker push satish2121/springboot-pipeline-automation'    
                }
            }
        }
    }
}