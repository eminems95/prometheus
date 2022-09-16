pipeline {
    agent any
    stages{
        stage('Build') {
            steps {
                echo 'BUILD'
                git branch: 'main', url: 'https://github.com/eminems95/react.git'
                dir('react') {
                    sh 'docker build . -f build.dockerfile -t builder'
                }
            }
        }
        stage('Tests') {
            steps {
                echo 'TESTS'
                dir('react') {
                    sh 'docker build . -f test.dockerfile -t tester'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'DEPLOY'
                sh 'docker run --volume /var/jenkins_home/workspace/ReactPipeline/MM286201_termin2:/build builder mv -n build /build'
                dir('MM286201_termin2') {
                    
                    sh 'docker build . -f deploy.dockerfile -t deployer'
                }
                sh 'docker run --volume /var/jenkins_home/workspace/ReactPipeline/MM286201_termin2/build:/build -d -p 3000:80 deploy'
                sh 'docker stop $(docker ps -a -q)'
            }
        }    
          stage('Publish') {
            steps {
                echo 'PUBLISH'
                dir('MM286201_termin2') {
                    sh 'docker build . -f publish.dockerfile -t publisher'
                }
                sh "docker run --volume /var/jenkins_home/workspace/ReactPipeline/MM286201_termin2:/Archive publisher mv archive.tar.xz /Archive"
            }
        }   
    }
}
