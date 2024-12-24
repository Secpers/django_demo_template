pipeline {
    agent any
    environment {
        IMAGE_NAME = "secpers/django_devops"
    }
    stages {
        stage("test") {
            steps {
                build job: '/Глазырин_Илья/parametrized-test',
                    parameters: [
                        string(name: 'GIT_URL', value: "${GIT_URL}"),
                        string(name: 'GIT_BRANCH', value: "${GIT_BRANCH}"),
                        string(name: 'PROJECT_NAME', value: "first")
                    ]
            }
        }
        stage("build") {
            steps {
                build job: '/Глазырин_Илья/parametrized-build',
                    parameters: [
                        string(name: 'GIT_URL', value: "${GIT_URL}"),
                        string(name: 'GIT_BRANCH', value: "${GIT_BRANCH}"),
                        string(name: 'IMAGE_NAME', value: "${IMAGE_NAME}"),
                        string(name: 'GIT_COMMIT_HASH', value: "${GIT_COMMIT}")
                    ]
            }
        }
        stage("push") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dee582b5-2f80-4c80-8fb5-a7d62ed91f0a', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh 'docker login -u ${USERNAME} -p ${PASSWORD}'
                    sh 'docker push ${IMAGE_NAME}:${GIT_COMMIT}'
                    sh 'docker push ${IMAGE_NAME}:latest'
                }
            }
        }
    }
}
