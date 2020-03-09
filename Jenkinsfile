pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh "ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa 2>/dev/null <<< y >/dev/null"
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
