pipeline{
    agent{
        any
    }
    stages{
        stage('Pulling the code'){
            agent{
                label "Linux_Node"
            }
            steps{
                
            }
        }
        }
        stage('Building and starting the image'){
            agent{
                label "Linux_Node"
            }
            steps {
                bat "docker-compose up --build -d"
            }
        }
        stage('Pushing the docker image to dockerhub'){
            agent{
                label "Linux_Node"
            }
            steps{

            }
        }
        }
    }
}
