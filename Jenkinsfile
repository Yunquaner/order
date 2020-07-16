#!/usr/bin/env groovy
pipeline {
    agent any 
    stages {
        stage('send-to-slack') {
            steps {
                slackSend channel: 'aflac', color: '#439FE0', message: "Build Started: ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)" , teamDomain: 'ibmcicchina', tokenCredentialId: 'Sarf'
            }
        }
        stage('Build') { 
            steps {
                sh './jenkins/run_maven_build.sh'
            }
        }
        //stage('Dependency-Check') { 
        //    steps {
        //        script {
        //            dependencycheck additionalArguments: ' --project DEMO_01 --scan ./ --out Dependency-check-report.xml --format XML ' , odcInstallation: 'Owasp-Dependency-Check'
        //            dependencyCheckPublisher pattern: 'Dependency-check-report.xml', unstableTotalHigh: 50
        //        }
        //    }
        //}
        stage('Deploy') { 
            steps {
                sh './deploy.sh'
            }
        }
    }
}
