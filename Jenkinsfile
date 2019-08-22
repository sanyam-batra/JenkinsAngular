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
  
   /*stage('StartApp') {
    nodejs(nodeJSInstallationName: 'nodejs1', configId: null){
      sh'npm install http-server -g'
      sh'http-server -p 3000 -o'
      sh'nohup npm run start &'
    }
  }*/
  
  /*stage('Build image') {
    sh 'docker build -t jenkins-angularapp:ver6 .'
  }
 
  stage('Push image') {
    withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: "DockerPass", usernameVariable: "DockerUser")]) {
            sh 'docker login -u $DockerUser -p $DockerPass'
            sh 'docker tag jenkins-angularapp:ver6 sanyambatra13/jenkins-angularapp:ver6'
            sh 'docker push sanyambatra13/jenkins-angularapp:ver6'
    }
  }*/
  
  /*stage('Terraform') {
    sh 'terraform init'
    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'SanyamAWS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
        sh 'terraform plan'
        sh 'terraform apply -auto-approve'
}
      
  }*/
  
  stage('Connection Test Server') {
    sshagent(['SanyamKey']) {
    
      sh 'scp -v -o StrictHostKeyChecking=no /var/jenkins_home/workspace/Jenkins_Angular/dockerexec.sh ec2-user@52.201.186.196:/home/ec2-user'
      sh 'ssh -T -o StrictHostKeyChecking=no ec2-user@ec2-52-201-186-196.compute-1.amazonaws.com'
      sh 'ssh ec2-user@ec2-52-201-186-196.compute-1.amazonaws.com sudo su -'
      sh 'ssh ec2-user@ec2-52-201-186-196.compute-1.amazonaws.com sudo yum update -y'
      sh 'ssh ec2-user@ec2-52-201-186-196.compute-1.amazonaws.com sudo yum install -y docker'
      sh 'ssh ec2-user@ec2-52-201-186-196.compute-1.amazonaws.com sudo service docker start'
      sh 'ssh ec2-user@ec2-52-201-186-196.compute-1.amazonaws.com sudo usermod -aG docker ec2-user'
      sh 'ssh ec2-user@ec2-52-201-186-196.compute-1.amazonaws.com cd /home/ec2-user'
      sh 'ssh ec2-user@ec2-52-201-186-196.compute-1.amazonaws.com sudo chmod +x dockerexec.sh'
      //sh 'export JENKINS_NODE_COOKIE=dontKillMe'
      sh 'ssh ec2-user@ec2-52-201-186-196.compute-1.amazonaws.com sudo bash dockerexec.sh'
      
    }
  }
  
  stage('Test Server Testing') {
    def response = sh(script: 'curl http://ec2-52-201-186-196.compute-1.amazonaws.com:3000', returnStdout: true)
  }
    if(response != "HTTP/1.1 200 OK") {
      currentBuild.result = 'FAILURE'
      return
    }
    else {
      stage('Connection Prod server') {
      sshagent(['SanyamKey']) {
      sh 'scp -i /terraform-jenkins.pem /var/jenkins_home/workspace/Jenkins_Angular/dockerexec.sh ec2-user@52.45.120.161:/home/ec2-user'
      sh 'ssh -T -o StrictHostKeyChecking=no ec2-user@ec2-52-45-120-161.compute-1.amazonaws.com'
      sh 'ssh ec2-user@ec2-52-45-120-161.compute-1.amazonaws.com sudo su -'
      sh 'ssh ec2-user@ec2-52-45-120-161.compute-1.amazonaws.com sudo yum update -y'
      sh 'ssh ec2-user@ec2-52-45-120-161.compute-1.amazonaws.com sudo yum install -y docker'
      sh 'ssh ec2-user@ec2-52-45-120-161.compute-1.amazonaws.com sudo service docker start'
      sh 'ssh ec2-user@ec2-52-45-120-161.compute-1.amazonaws.com sudo usermod -aG docker ec2-user'
      sh 'ssh ec2-user@ec2-52-45-120-161.compute-1.amazonaws.com cd /home/ec2-user'
      sh 'ssh ec2-user@ec2-52-45-120-161.compute-1.amazonaws.com sudo chmod +x dockerexec.sh'
      //sh 'export JENKINS_NODE_COOKIE=dontKillMe'
      sh 'ssh ec2-user@ec2-52-45-120-161.compute-1.amazonaws.com sudo bash dockerexec.sh'
    }
    }
  }
}
