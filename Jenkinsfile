pipeline {
    agent any

    tools {
        nodejs 'NODE16'   
    }

    environment {
        CI = 'true'
    }

    stages {

        stage('Fetch code') {
            steps {
                git branch: 'main', url: 'https://github.com/cyanexttime/backend-angular-app.git'
            }
        }

        stage('Build') {
            steps {
                sh './deploy.sh'
            }
        }

        
    }
}
