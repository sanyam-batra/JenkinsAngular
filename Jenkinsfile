/*def jiraticket() {

    "fields": {
       "project":
       {
          "key": "AN"
       },
       "summary": "Jira issue from jenkins",
       "description": "Creating jira issue as build failed.",
       "issuetype": {
          "name": "Bug"
       },
      "assignee":{"name":"batsam98"}
   }
}*/


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
      sh'npm run buil'
    }
  }
  
   //stage('StartApp') {
    //nodejs(nodeJSInstallationName: 'nodejs1', configId: null){
      /*sh'npm install http-server -g'
      sh'http-server -p 3000 -o'*/
      //sh'npm run start'
    //}
  //}
 
  post {
    success {
      echo 'Success'
    }
    failure {
      echo 'Failure'
      /*stage('JIRA') {
    def testIssue = [fields: [ project: [id: 'AN'],
                           summary: 'New JIRA Created from Jenkins.',
                           description: 'Creating jira issue as build failed.',
                           issuetype: [id: '10002']]]

response = jiraNewIssue issue: testIssue, site: 'http://localhost:8054'

echo response.successful.toString()
echo response.data.toString()
    
  }*/
  }
}
}
