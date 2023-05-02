pipeline{
    agent any
    stages{
        stage('checkout code'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/TejaBadugu/Node_js_Project']])
            }
        }
        stage('Build docker image'){
            steps{
             script{
                 sh 'docker build -t images:3.0 .'
             }   
            }
        }
        stage('create docker container'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'teja1', variable: 'teja1')]){
                        sh 'docker login -u tejabadugu -p ${teja1}'
                    }
                       sh 'docker tag images:3.0 tejabadugu/nodejs:3.0'
                       sh 'docker push tejabadugu/nodejs:3.0'
                       sh 'docker container run -d -p 3000:3000 images:3.0 npm run start'
                }
            }
        }
    }
}
