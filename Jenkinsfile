pipeline {
    agent {
        kubernetes {
            label 'jenkins-765dbbff7-nvtvt'
            yaml """
apiVersion: v1
kind: Pod
metadata:
labels: 
    component: ci
spec:
    containers:
        - name: python
        - image: python:latest
        - command: 
            - cat
        - tty: true
"""
        }
    }

    stages {
        stage('Test python') {
            steps {
                container('python') {
                    sh "pip install -r requirements.txt"
                    sh "python test.py"
                }
            }
        }
    }
}