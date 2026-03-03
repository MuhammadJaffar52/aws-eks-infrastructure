pipeline {
    agent any

    environment {
        AWS_REGION        = 'us-west-2'
        ECR_REGISTRY      = '744804011934.dkr.ecr.us-west-2.amazonaws.com'
        ECR_REPO          = 'infra-env-app'
        IMAGE_TAG         = "${BUILD_NUMBER}"
        CLUSTER_NAME      = 'infra-env-cluster'
    }

    stages {

        stage('Checkout Code') {
            steps {
                echo 'Checking out code from GitHub...'
                git branch: 'main',
                    url: 'https://github.com/MuhammadJaffar52/aws-eks-infrastructure.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh """
                    docker build -t ${ECR_REGISTRY}/${ECR_REPO}:${IMAGE_TAG} .
                    docker tag ${ECR_REGISTRY}/${ECR_REPO}:${IMAGE_TAG} ${ECR_REGISTRY}/${ECR_REPO}:latest
                """
            }
        }

        stage('Push To ECR') {
            steps {
                echo 'Pushing image to ECR...'
                sh """
                    aws ecr get-login-password --region ${AWS_REGION} | \
                    docker login --username AWS --password-stdin ${ECR_REGISTRY}
                    
                    docker push ${ECR_REGISTRY}/${ECR_REPO}:${IMAGE_TAG}
                    docker push ${ECR_REGISTRY}/${ECR_REPO}:latest
                """
            }
        }

        stage('Deploy To EKS') {
            steps {
                echo 'Deploying to EKS...'
                sh """
                    aws eks update-kubeconfig --region ${AWS_REGION} --name ${CLUSTER_NAME}
                    
                    sed -i 's|latest|${IMAGE_TAG}|g' k8s/app-deployment.yaml
                    
                    kubectl apply -f k8s/app-deployment.yaml
                    
                    kubectl rollout status deployment/app
                """
            }
        }

    }

    post {
        success {
            echo '✅ Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
    }
}
