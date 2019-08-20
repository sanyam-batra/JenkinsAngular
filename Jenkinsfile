node {
  stage('Checkout'){
    checkout scm
  }
  /*stage('NPM Install'){
    nodejs(nodeJSInstallationName: 'nodejs1', configId: null){
    sh 'npm install'
    //sh 'npm install npm@latest -g'
  }
  }*/
  /*stage('Sonar') {
    def scannerHome = tool 'angular_sonar';
    withSonarQubeEnv('SonarQube') {
      sh'/opt/sonarscanner/sonar-scanner-3.2.0.1227-linux/bin/sonar-scanner'
    }
  }*/
  /*stage('Build') {
    try {
    nodejs(nodeJSInstallationName: 'nodejs1', configId: null){
      sh'npm run build'
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
  }*/
  
   //stage('StartApp') {
    //nodejs(nodeJSInstallationName: 'nodejs1', configId: null){
      /*sh'npm install http-server -g'
      sh'http-server -p 3000 -o'*/
      //sh'npm run start'
    //}
  //}
  
  /*stage('Build image') {
    sh 'docker build -t jenkins-angularapp:ver5 .'
  }*/
 
  /*stage('Push image') {
    withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: "DockerPass", usernameVariable: "DockerUser")]) {
            sh 'docker login -u $DockerUser -p $DockerPass'
            sh 'docker tag jenkins-angularapp:ver5 sanyambatra13/jenkins-angularapp:ver5'
            sh 'docker push sanyambatra13/jenkins-angularapp:ver5'
    }
  }*/
  
  stage('Terraform') {
    sh 'terraform init'
    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'SanyamAWS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
        sh 'terraform plan'
        sh 'terraform apply -auto-approve'
}
      
  }
  
  stage('Connection Test Server') {
    sshagent(['SanyamKey']) {
      sh 'scp dockerexec.sh 52.201.186.196:/home/ec2-user'
      sh 'ssh -o StrictHostKeyChecking=no ec2-user@ec2-52-201-186-196.compute-1.amazonaws.com'
      sh 'ssh sudo su -'
      sh 'ssh sudo yum update -y'
      sh 'sudo yum install -y docker'
      sh 'sudo service docker start'
      sh 'sudo usermod -aG docker ec2-user'
      sh 'ssh cd /home/ec2-user'
      sh 'chmod +x dockerexec.sh'
      sh 'ssh ec2-user@ec2-52-201-186-196.compute-1.amazonaws.com bash dockerexec.sh '
    }
  }
  
  /*(stage('Test Server Testing') {
    if() {
    }
    else {
      
    }
  }*/
}
