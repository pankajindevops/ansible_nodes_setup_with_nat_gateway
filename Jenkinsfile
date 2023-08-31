
pipeline {

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/pankajindevops/ansible_nodes_setup']])
            }
        }
        
        stage("init") {
            steps  {
                sh ("terraform init -reconfigure")
            }
        }
        
        stage("plan") {
            steps {
                sh ("terraform plan")
            }
        }
        
        stage ("action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ("terraform ${action} --auto-approve")
            }
        }
    }
}
