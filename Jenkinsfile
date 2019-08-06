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
       sh'npm install --save-dev karma-phantomjs-launcher'
       withEnv(["PHANTOMJS_BIN=/usr/local/bin/phantomjs"]) {
    sh 'npm run test --progess=false --watch=false --browsers=PhantomJS'
     }
     }
    junit '**/test-results.xml'
  }
}
