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
      sh'/opt/sonarscanner/sonar-scanner-3.2.0.1227-linux/bin/sonar-scanner'
    }
  }*/
  stage('Build') {
    nodejs(nodeJSInstallationName: 'nodejs1', configId: null){
      sh'npm run build'
    }
  }
  stage('StartApp') {
    nodejs(nodeJSInstallationName: 'nodejs1', configId: null){
      sh'npm install -g @angular/cli'
      sh'npm install @types/jasmine'
      sh'npm install "concurrently"'
      sh'npm install "lite-server"'
      sh 'ng serve'
    }
  }
}
