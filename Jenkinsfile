pipeline {
    agent { label 'kaas' }
    stages {
        stage('Check Pull-Request Status') {
            when { changeRequest target: 'master' }
            steps { checkPullRequestStatus() }
        }
        stage('Apply Resources') {
            when { branch 'master' }
            steps {
                applyPrmResources()
                createTopicsAndAcls()
            }
        }
    }
    post {
        always { echo 'This will always run' }
        success { echo 'This will run only if successful' }
        failure {
            script {
                if (env.BRANCH_NAME == 'master') {
                    echo 'This will run only if failed'
                }
            }
        }
        unstable { echo 'This will run if unstable' }
        changed { echo 'This will run if the Pipeline state has changed' }
    }
}

def checkPullRequestStatus() {
    script {
        echo 'Checking pull request status...'
        // Add your pull request checking logic here
    }
}

def applyPrmResources() {
    script {
        // Replace with your actual logic, e.g., pulling images
        sh 'docker pull your-image:latest'
    }
}

def createTopicsAndAcls() {
    script {
        // Replace with your actual logic for topics and ACLs
        sh 'docker run your-image create-topics-and-acls'
    }
}
