#!/usr/bin/env groovy
pipeline {
    agent any 
    stages {
        /*stage('Build') { 
            steps {
                sh './jenkins/run_maven_build.sh'
            }
        }*/
        stage('Dependency-Check') { 
            steps {
                script {
                    dependencycheck additionalArguments: ' --project DEMO_01 --scan ./ --out Dependency-check-report.xml --format XML ' , odcInstallation: 'Owasp-Dependency-Check'
                    dependencyCheckPublisher pattern: 'Dependency-check-report.xml', unstableTotalHigh: 50
                }
            }
        }
        stage('Deploy') { 
            steps {
                sh './deploy.sh'
            }
        }
    }
}
