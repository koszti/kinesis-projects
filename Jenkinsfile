node {
    jobStarted()
    checkout scm
    try {
        sh('java -jar ~/bin/kinesis-2.0.0-SNAPSHOT-standalone.jar')
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
