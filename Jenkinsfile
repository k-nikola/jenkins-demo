pipeline{
    agent{
        any
    }
    stages{
        stage('Pulling the code'){
            agent{
                label "Windows_Node"
            }
            steps{
                bat "cd D:\ict\DevOps\jenkins-demo"
                bat "git init"
                bat "git pull https://github.com/k-nikola/jenkins-demo.git"
            }
        }
        }
        stage('Building and starting the image'){
            agent{
                label "Windows_Node"
            }
            steps {
                bat "docker-compose up --build -d"
            }
        }
        stage('Pushing the docker image to dockerhub'){
            agent{
                label "Windows_Node"
            }
            steps{

            }
        }
        }
    }
}
