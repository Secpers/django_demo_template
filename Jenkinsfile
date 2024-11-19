pipeline {
    agent {
        docker {
            image 'python:latest'
            args '-u root'
        }
    }
    stages {
        stage("deps") {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }
	    stage("coverage") {
	        steps {
                sh 'python manage.py test'
            }
        }
        stage("reports") {
            steps {
                sh 'coverage xml'
            }
        }
    }
    post {
        success {
            recordCoverage(tools: [[parser: 'COBERTURA', pattern: 'coverage.xml']],
                id: 'COBERTURA', name: 'COBERTURA Coverage',
                sourceCodeRetention: 'EVERY_BUILD')
        }
    }
}
