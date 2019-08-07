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
  /*stage('Sonar') {
    def scannerHome = tool 'angular_sonar';
    withSonarQubeEnv('SonarQube') {
      sh'${scannerHome}/bin/sonar-scanner'
    }
  }*/
  stage('Build') {
    nodejs(nodeJSInstallationName: 'nodejs1', configId: null){
      sh'npm run build'
    }
  }
}
