pipeline
{
    agent any
    stages
    {
        stage('continuous download')
        {
            steps
            {
               script 
               {
                   try
                   {
                        git 'https://github.com/keshavr21/maven_test.git'
                   }
                   catch(Exception e1)
                   {
                          mail bcc: '', body: '', cc: 'manager@xyz.com', from: '', replyTo: '', subject: 'build job got failed', to: 'devops@xyz.com'
                          exit 1
                   }
               }
              
            }
        }
        stage('continuous build')
        {
            steps
            {
                script
                {
                   try
                   {
                       sh 'mvn clean package'
                   }
                   catch(Exception e2)
                   {
                        mail bcc: '', body: '', cc: 'manager@xyz.com', from: '', replyTo: '', subject: 'build job got failed', to: 'devops@xyz.com'
                        exit 2
                   }
                }
                
            }
        }
        stage('continuous deploy')
        {
            steps
            {
                deploy adapters: [tomcat9(credentialsId: '8455cace-4454-464a-b289-ba65b1f34576', path: '', url: 'http://172.31.4.38:8080')], contextPath: 'testapp', war: '**/*.war'
            }
        }
        stage('continuous testing')
        {
            steps
            {
                git 'https://github.com/keshavr21/test_cases.git'
                sh 'java -jar $WORKSPACE/testing.jar'
            }
        }
        stage('continuous delivery')
        {
            steps
            {
                deploy adapters: [tomcat9(credentialsId: '8455cace-4454-464a-b289-ba65b1f34576', path: '', url: 'http://172.31.4.38:8080')], contextPath: 'prodapp', war: '**/*.war'
            }
        }
        
    }
    
}
