pipeline {
    agent any

    environment {
        BLUE_PORT = '5000'
        GREEN_PORT = '5001'
        VERSION = '2.0.0'
        FLAG_FILE = 'traffic_flag.txt'
    }

    stages {
        stage('Determine Active Environment') {
            steps {
                script {
                    def flag = readFile(FLAG_FILE).trim()
                    env.ACTIVE_ENV = flag
                    env.INACTIVE_ENV = (flag == 'blue') ? 'green' : 'blue'
                    echo "Active Environment: ${env.ACTIVE_ENV}"
                    echo "Deploying to: ${env.INACTIVE_ENV}"
                }
            }
        }

        stage('Deploy to Inactive Environment') {
            steps {
                script {
                    def scriptName = (env.INACTIVE_ENV == 'blue') ? 'deploy-to-blue.bat' : 'deploy-to-green.bat'
                    bat "scripts\\${scriptName} ${VERSION}"
                }
            }
        }

        stage('Health Check') {
            steps {
                script {
                    def port = (env.INACTIVE_ENV == 'blue') ? BLUE_PORT : GREEN_PORT
                    bat "scripts\\health-check.bat ${port}"
                }
            }
        }

        stage('Switch Traffic') {
            steps {
                script {
                    bat "echo ${env.INACTIVE_ENV} > ${FLAG_FILE}"
                    echo "Traffic switched to ${env.INACTIVE_ENV}"
                }
            }
        }

        stage('Mark Standby') {
            steps {
                echo "${ACTIVE_ENV} is now in standby mode."
            }
        }
    }
}
