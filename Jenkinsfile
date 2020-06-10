pipeline {
  agent any
  stages {
    stage('get') {
      parallel {
        stage('get') {
          steps {
            echo 'get'
          }
        }

        stage('init') {
          steps {
            sleep 10
          }
        }

        stage('test') {
          steps {
            echo 'test'
          }
        }

      }
    }

    stage('approve') {
      steps {
        echo 'aprove'
      }
    }

  }
}