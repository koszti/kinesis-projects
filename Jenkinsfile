node {
    jobStarted()
    checkout scm
    try {
        stage('Cleanup') {
            sh('rm -f kinesis.log')
            sh('rm -rf report-*')
        }
        stage('Kinesis Test') {
            sh('./test.sh')
        }
        jobSuccessful()
    } catch (e) {
        currentBuild.result = "FAILED"
        jobFailed()
        throw e;
    } finally {
        archiveReports()    
    }
}

def archiveReports() {
    stage('Archive Test Reports') {
        archiveArtifacts artifacts: '**/report-*/'
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
