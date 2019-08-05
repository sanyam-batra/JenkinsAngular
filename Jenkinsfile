node {
  tool name: 'nodejs1', type: 'nodejs'
  stage('Checkout'){
    checkout scm
  }
  stage('NPM Install'){
    nodejs(nodeJSInstallationName: 'nodejs1', configId: null){
    sh 'npm install'
  }
  }
  
}
