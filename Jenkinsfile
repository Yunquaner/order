#!/usr/bin/env groovy
pipeline {
    agent any 
    stages {
    //    stage('send-to-slack') {
    //        steps {
    //            slackSend channel: 'aflac', color: '#439FE0', message: "Build Started: ${env.JOB_NAME} ${env.BUILD_NUMBER} (<${env.BUILD_URL}|Open>)" , teamDomain: 'ibmcicchina', tokenCredentialId: 'Sarf', failOnError: true
    //        }
    //    }
    //    stage('Build') { 
    //        steps {
    //            sh './jenkins/run_maven_build.sh'
    //        }
    //    }
        stage('SonarQube analysis') {
            steps {
                sh 'mvn sonar:sonar \
                -Dsonar.projectKey=To_do_list \
                -Dsonar.host.url=http://cnwbzp1068.cn.dst.ibm.com:9000/sonarqube \
                -Dsonar.login=753fecef19555f2999245f0b8fdefb8aaf52f6c7'
            }
        }
        stage('send-to-slack') {
            steps {
               slackSend channel: 'yy-sonar-test', color: '#439FE0', message: "Project [To_do_list] analyzed. See http://cnwbzp1068.cn.dst.ibm.com:9000/sonarqube/dashboard?id=To_do_list." , teamDomain: 'phcompanyworkspace', tokenCredentialId: 'Sera'
               slackSend channel: 'charles-sonar-test', color: '#439FE0', message: "Project [To_do_list] analyzed. See http://cnwbzp1068.cn.dst.ibm.com:9000/sonarqube/dashboard?id=To_do_list." , teamDomain: 'phcompanyworkspace', tokenCredentialId: 'Sera'
               slackSend channel: 'yy-sonar-private', color: '#439FE0', message: "Project [To_do_list] analyzed. See http://cnwbzp1068.cn.dst.ibm.com:9000/sonarqube/dashboard?id=To_do_list." , teamDomain: 'phcompanyworkspace', tokenCredentialId: 'Sera'
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
        //stage('Deploy') { 
        //    steps {
        //        sh './deploy.sh'
        //    }
        //}
    }
}
