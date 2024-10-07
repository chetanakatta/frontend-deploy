pipeline {

    agent {
        label 'AGENT-1' // our agent name
    }

    options {

        //after particular time job will be failed (timeout counter starts before agent is allocated)
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds() //disables multiple executions
        ansiColor('xterm')

    }

    parameters {
        string(name: 'appVersion', defaultValue: '1.0.0', description: 'what is the application version?')
    }

    environment {

        def appVersion = ''  //variable declaration
        nexusUrl = 'nexus.expense.fun:8081'

    }

    stages {

        stage ('print the version') { 
            steps {
                script {
                    echo "application version: ${params.appVersion}"
                }
            }
        }

        stage ('Init') {
            steps {
               sh """
               cd terraform
               terraform init
               """      
            }
        }

        stage ('Plan') {
            steps {
               sh """
               cd terraform
               terraform plan -var="app_version=${params.appVersion}"
               """      
            }
        }

        stage ('Deply') {
            steps {
               sh """
               cd terraform
               terraform apply -auto-approve -var="app_version=${params.appVersion}"
               """      
            }
        }
    }    
    post { //useful as alert for success or failure

        always {
            echo 'I will always say hello'
            deleteDir()    //to delete workspace after build
        }

        success {
            echo 'I will run when pipeline is success'
        }

        failure {
            echo 'I will run when pipeline is failure'
            // we configure with slack, when failed we get messege
        }
    }
}
    