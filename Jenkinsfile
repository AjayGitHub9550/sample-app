pipeline {
    agent any

    environment {
        GCP_PROJECT = 'DevOps-MF'
        GCR_REGION = 'us-central1'
        IMAGE_NAME = "${GCR_REGION}-docker.pkg.dev/sample-repo/sample-app"
        GCP_CREDENTIALS = credentials('gcp-service-account') // Add this in Jenkins credentials
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/AjayGitHub9550/sample-app.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${BUILD_NUMBER}")
                }
            }
        }

        stage('Push to GCR') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'gcp-service-account', url: "https://${GCR_REGION}-docker.pkg.dev") {
                        docker.image("${IMAGE_NAME}:${BUILD_NUMBER}").push()
                    }
                }
            }
        }

        stage('Deploy to GKE') {
            steps {
                withCredentials([file(credentialsId: 'gcp-key-json', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                    sh '''
                        gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS
                        gcloud config set project $GCP_PROJECT
                        gcloud container clusters get-credentials devops-task-cluster --region $GCR_REGION

                        kubectl set image deployment/sample-app-deployment sample-app=${IMAGE_NAME}:${BUILD_NUMBER} --record
                    '''
                }
            }
        }
    }
}
