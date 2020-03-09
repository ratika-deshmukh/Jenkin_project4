pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '/usr/local/bin/docker-compose up -d'
            }
        }
        stage('Deploy') {
          steps {
            sh 'sudo ansible-playbook -i inventory playbook1.yml'
          }
        }
        stage('Test') {
          steps {
            sh 'curl http://localhost:4500'
          }
        }
        stage('cleanup') {
            steps {
             sh '/usr/local/bin/docker-compose down'
            }
        }
    }
}
