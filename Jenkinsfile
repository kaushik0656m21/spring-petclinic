pipeline{
    agent any 
    stages {
        stage (' build '){
            steps{
                git url: 'https://github.com/kaushik0656m21/spring-petclinic'
                sh '/opt/apache-maven-3.6.3/bin/mvn clean package '
            }
        }
        stage ('docker image'){
            steps{
                sh 'sudo docker build   -t kaushik0656m21/petclinic1:${BUILD_NUMBER} .'
            }
        }
        stage ('docker hub ') {
            steps{
                withCredentials([string(credentialsId: 'docker_hub_pwd', variable: 'docker_hub_pwd')]) {
                 sh ' sudo docker login -u kaushik0656m21 -p${docker_hub_pwd}'
                 }
                 sh ' sudo docker push kaushik0656m21/petclinic1:${BUILD_NUMBER}'
            }
        }
        stage ('kubernetes deploy') {
            steps{
                sh 'envsubst < ${WORKSPACE}/deploy.yaml | sudo  kubectl apply -f -'
            }
        }
    }
}
