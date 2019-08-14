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
    //sh 'npm install npm@latest -g'
  }
  }
  /*stage('Sonar') {
    def scannerHome = tool 'angular_sonar';
    withSonarQubeEnv('SonarQube') {
      sh'/opt/sonarscanner/sonar-scanner-3.2.0.1227-linux/bin/sonar-scanner'
    }
  }*/
  stage('Build') {
    try {
    nodejs(nodeJSInstallationName: 'nodejs1', configId: null){
      sh'npm run buil'
    }
    }
    catch(exec){
      def testIssue = [fields: [ project: [id: '10001'],
                           summary: 'New JIRA Created from Jenkins.',
                           description: 'Creating jira issue as build failed.',
                           issuetype: [id: '10002']]]

response = jiraNewIssue issue: testIssue, site: 'JIRA'

echo response.successful.toString()
echo response.data.toString()
     jiraAssignIssue idOrKey: 'AN-14', userName: 'batsam98',site: 'JIRA'
    }
  }
  
   //stage('StartApp') {
    //nodejs(nodeJSInstallationName: 'nodejs1', configId: null){
      /*sh'npm install http-server -g'
      sh'http-server -p 3000 -o'*/
      //sh'npm run start'
    //}
  //}
  
  stage('Build image') {
    sh 'docker build -t jenkins-angularapp:ver1 .'
  }
 
  stage('Push image') {
    withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: "DockerPass", usernameVariable: "DockerUser")]) {
            sh 'docker login -u $DockerUser -p $DockerPass'
            sh 'docker tag jenkins-angularapp:ver1 sanyambatra13/jenkins-angularapp:ver1'
            sh 'docker push sanyambatra13/jenkins-angularapp:ver1'
    }
  }
  
  /*stage('Terraform') {
  }*/
}
