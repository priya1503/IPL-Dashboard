def projectName = 'ipldashboard'
def version = "0.0.${currentBuild.number}"
def dockerImageTag = "${projectName}:${version}"

pipeline {
  agent any

  stages {
    stage('Test') {
      steps {
        sh 'chmod a+x mvnw'
        sh './mvnw clean test'
      }
    }

    stage('Build') {
      steps {
        sh './mvnw package'
      }
    }

    stage('Build Container') {
      steps {
        sh "docker build --tag ${dockerImageTag} ."
      }
    }

    stage('Deploy Container To Openshift') {
      steps {
        sh "oc login https://44.197.34.152:8443 --username admin --password admin --insecure-skip-tls-verify=true"
        sh "oc project ${projectName} || oc new-project ${projectName}"
        sh "oc delete all --selector app=${projectName} || echo 'Unable to delete all previous openshift resources'"
        sh "oc new-app ${dockerImageTag} -l version=${version}"
        sh "oc status"
        sh "oc expose dc/${projectName} --port=8081"
        sh "oc expose svc/${projectName}"
        sh "oc status"
      }
    }
  }
}