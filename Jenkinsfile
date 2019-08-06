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
       sh'npm install karma-firefox-launcher --save-dev'
       withEnv(["FIREFOX_BIN=/usr/bin/firefox"]) {
    sh 'npm run test --progess=false --watch=false --browsers=Firefox'
     }
     }
    junit '**/test-results.xml'
  }
}
