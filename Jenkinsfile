node {
    jobStarted()
    checkout scm
    try {
        stage('Checkout and Cleanup') {
            sh('rm -f kinesis.log')
            sh('find . -depth -type d -name "report-*" -exec rm -r "{}" \\;')
        }
        stage('Olympics') {
            sh('./test.sh Olympics')
        }
        stage('Education') {
            sh('./test.sh Education')
        }
        stage('fashion_orders') {
            sh('./test.sh fashion_orders')
        }
        stage('Demo_Project') {
            sh('./test.sh demo_project')
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
    echo "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
}

def jobSuccessful() {
    echo "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
}

def jobFailed() {
    echo "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})"
}
