node {
  stage('Checkout'){
    checkout scm
  }
  stage('NPM Install'){
    nodejs(nodeJSInstallationName: 'nodejs1', configId: null){
    sh 'npm install'
    sh 'npm install npm@latest -g'
  }
  }
  stage('Sonar') {
    withSonarQubeEnv('SonarQube') {
      
      sh'sonar-scanner'
    }
  }
}
