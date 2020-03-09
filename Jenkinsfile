pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh "sudo ssh-keygen -f id_rsa -t rsa -N ''"
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
    }
}
