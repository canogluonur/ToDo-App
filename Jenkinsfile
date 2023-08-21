pipeline {
    agent any
    
    environment {
        DOCKER_REGISTRY = 'coolboi567/todo-flaskapp'
        KUBE_CONFIG = credentials('kube-config-credentials-id')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            when {
            expression {
                return currentBuild.changeSets.any { changeSet ->
                    changeSet.items.any { item ->
                        item.path.endsWith('/Dockerfile') || item.path.startsWith('app.py')
                }
            }
        }
    }         
            steps {
                script {
                    def dockerImage = docker.build("${DOCKER_REGISTRY}:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Push to Docker Registry') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'docker-hub-credentials') {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            when  { 
                    changeset '**/k8s/*'
                }    
            steps {
                script {
                    sh "kubectl --kubeconfig=${KUBE_CONFIG} set image deployment/todo-flaskapp todo-flaskapp=${DOCKER_REGISTRY}:${env.BUILD_NUMBER}"
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
