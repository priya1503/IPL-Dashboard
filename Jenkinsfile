def projectName = 'ipldashboard'

def version = "0.0.${currentBuild.number}"

def appName = "${projectName}-app"

def dockerAppImageTag = "${projectName}-app:${version}"

pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                sh 'chmod a+x mvnw'
                sh "./mvnw clean test"
            }
        }

        stage('Package Application Into Jar') {
            steps {
                sh "./mvnw package"
            }
        }

        stage('Build docker image') {
            steps {
                sh "docker build -f Dockerfile -t ${dockerAppImageTag} $WORKSPACE"
            }
        }

        stage('Deploy image To OpenShift') {
            steps {
                sh "oc login https://localhost:8443 --username admin --password admin --insecure-skip-tls-verify=true"
                sh "oc project ${projectName} || oc new-project ${projectName}"
                sh "oc delete all -l app=${appName} || echo 'Unable to delete all previous OpenShift app resources'"
                sh "oc new-app ${appName}:${version}  -l version=${version}"
                sh "oc expose svc/${appName}"
            }
        }
    }
}
