pipeline {
    agent any
    environment {
        IMAGE_NAME = "iorp/glm_django_demo"
    }
    stages {
        stage("test") {
            steps {
                build job: '/Глазырин_Илья/parametrized-test',
                    parameters: [
                        string(name: 'GIT_URL', value: "${GIT_URL}"),
                        string(name: 'GIT_BRANCH', value: "${GIT_BRANCH}"),
                        string(name: 'PROJECT_NAME', value: "django_demo_site")
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
    }
}
