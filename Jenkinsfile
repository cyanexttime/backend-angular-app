pipeline {
    agent any

    tools {
        nodejs 'NODE16'   
    }

    environment {
        CI = 'true'
    }

    stages {

        // stage('Fetch code') {
        //     checkout scm
        // }

        stage('Archiving backend') {
            steps{
                sh 'zip -r angular-backend.zip server.js package*.json'
            }
        }

        stage('Archive artifact (Jenkins)') {
            steps {
                archiveArtifacts artifacts: 'angular-backend.zip', fingerprint: true
            }
        }

        stage('Push to Nexus repo') {
            steps {
                nexusArtifactUploader(
                nexusVersion: 'nexus3',
                protocol: 'http',
                nexusUrl: 'poc4k-central.ovng.dev.myovcloud.com:8081',
                version: "${env.BUILD_ID}-${env.BUILD_TIMESTAMP}",
                groupId: '',
                repository: 'backend-angular-app',
                credentialsId: 'nexuslogin',
                artifacts: [
                    [artifactId: 'angularbackend',
                     classifier: '',
                     file: "angular-backend.zip",
                     type: 'zip']
                    ]
                )
            }
        }

        // stage('Build') {
        //     steps {
        //         sh './deploy.sh'
        //     }
        // }

        
    }
    // testing push 
}
