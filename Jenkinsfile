pipeline{
    agent{
        any
    }
    stages{
        stage('Cleaning any previous images that exist'){
            steps{
                sh "docker kill $(docker ps -q)"
                sh "docker rm $(docker ps -a -q)"
            }
        }
        stage('Building and starting the image'){
            steps {
                sh "docker-compose up --build -d"
            }
        stage('Pushing the docker image to dockerhub')
        }
    }
}
