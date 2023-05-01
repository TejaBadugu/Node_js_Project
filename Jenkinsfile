pipeline{
    agent any
    stages{
        stage('checkout code'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/TejaBadugu/Node_js_Project.git']])
            }
        }
        stage('Build docker image'){
            steps{
             script{
                 sh 'docker build -t images:2.0 .'
             }   
            }
        }
        stage('create docker container'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'e39c6aee-4e98-4db1-9be4-37ce0520e5c5', variable: 'tejabadugu')]) {
                        sh 'docker login -u tejabadugu -p ${tejabadugu}'
                    }
                       sh 'docker tag images:2.0 tejabadugu/nodejs:2.0'
                       sh 'docker push tejabadugu/nodejs:2.0'
                       sh 'docker container run -d -p 3000:3000 images:2.0 npm run start'
                }
            }
        }
    }
}
