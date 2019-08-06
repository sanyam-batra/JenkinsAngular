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
  stage('Test'){
     nodejs(nodeJSInstallationName: 'nodejs1', configId: null){
    sh 'npm run ng test --progress=false --watch=false --browsers=ChromeHeadless'
     }
    junit '**/test-results.xml'
  }
}
