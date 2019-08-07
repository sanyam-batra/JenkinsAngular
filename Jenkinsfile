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
       sh'npm install --save-dev karma-chrome-launcher'
       withEnv(["CHROMIUM_BIN=/usr/bin/chromium"]) {
    sh 'npm run test --progess=false --watch=false --browsers=ChromeHeadless'
     }
     }
    junit '**/test-results.xml'
  }
}
