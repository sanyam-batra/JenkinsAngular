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
       withEnv(["CHROME_BIN=/usr/bin/chromium"]) {
    sh 'npm run test --progress=false --watch=false --browsers=ChromeHeadless'
     }
     }
    junit '**/test-results.xml'
  }
}
