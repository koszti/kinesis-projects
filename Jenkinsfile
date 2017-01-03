node {
    jobStarted()
    checkout scm
    try {
        stage('Test') {
            sh('./test.sh')
        }
        jobSuccessful()
    } catch (e) {
        currentBuild.result = "FAILED"
        jobFailed()
        throw e;
    }
}

def jobStarted() {
    hipchatSend (color: 'YELLOW', notify: true,
        message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
    )
}

def jobSuccessful() {
    hipchatSend (color: 'GREEN', notify: true,
        message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
    )
}

def jobFailed() {
    hipchatSend (color: 'RED', notify: true,
        message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
    )
}
