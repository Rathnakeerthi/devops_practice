

//properties([parameters([booleanParam(description: 'Check to plan Terraform changes', name: 'PLAN_TERRAFORM'), booleanParam(description: 'Check to apply Terraform changes', name: 'APPLY_TERRAFOR'), booleanParam(description: 'Check to apply Terraform changes', name: 'DESTROY_TERRAFORM')])])


pipeline {
    agent any

    parameters {
            booleanParam(name: 'PLAN_TERRAFORM', defaultValue: false, description: 'Check to plan Terraform changes')
            booleanParam(name: 'APPLY_TERRAFORM', defaultValue: false, description: 'Check to apply Terraform changes')
            booleanParam(name: 'DESTROY_TERRAFORM', defaultValue: false, description: 'Check to apply Terraform changes')
    }

    stages {
        stage('Clone Repository') {
            steps
            {
                // Clean workspace before cloning (optional)
                deleteDir()

                // Clone the Git repository
                git branch: 'main',
                    url: 'https://github.com/Rathnakeerthi/devops_practice.git'
                sh "ls -lart"
            }
        }

        stage('Terraform Init') {
                    steps{
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'Jenkins_user']]){
                            sh 'echo "=================Terraform Init=================="'
                            sh 'terraform init'
                        
                        }
                    }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    if (params.PLAN_TERRAFORM) {
                        /* groovylint-disable-next-line DuplicateListLiteral */
                        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'Jenkins_user']])

                            {
                                sh 'echo "=================Terraform Plan=================="'
                                sh 'terraform plan'
                            }
                        
                    }
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    if (params.APPLY_TERRAFORM) {
                       withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'Jenkins_user']])
                           
                            {
                                sh 'echo "=================Terraform Apply=================="'
                                sh 'terraform apply -auto-approve'
                            }
                       
                    }
                }
            }
        }

        stage('Terraform Destroy') {
            steps {
                script {
                    if (params.DESTROY_TERRAFORM) {
                       withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'Jenkins_user']])
                            {
                            //hi
                                sh 'echo "=================Terraform Destroy=================="'
                                sh 'terraform destroy -auto-approve'
                            }
                       
                    }
                }
            }
        }
    }

}
