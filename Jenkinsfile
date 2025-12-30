pipeline{
    agent any
    environment{
        IMAGE_NAME = "arjunckm/frontend:${BUILD_NUMBER}"
    }
 stages{
        stage("GIT"){
            steps{
                git url:"https://github.com/Gotoman12/Frontend-Backend-application.git",branch: "front-end"
            }
        }
        stage("docker-build"){
            steps{
               sh 'docker build -t ${IMAGE_NAME} .'
            }
        }
        stage("Docker-login"){
            steps{
               script{
                withCredentials([usernamePassword(credentialsId: 'DOCKER_HUB_CRED', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                      sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    }
               }
            }
        }
        stage("docker-run"){
            steps{
                sh 'docker kill frontend'
                sh 'docker rm frontend'
               sh 'docker run -it -d --name frontend -p 5001:80 ${IMAGE_NAME}'
            }
        }
        stage("docker-push"){
            steps{
               sh 'docker push ${IMAGE_NAME}'
            }
        }
    }
}