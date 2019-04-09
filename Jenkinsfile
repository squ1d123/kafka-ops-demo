
node {
    stage('Checkout repo') {
        checkout scm
    }

    docker.image('hashicorp/terraform:0.11.13').inside("--network=host -e HOME=${HUDSON_HOME} --entrypoint=''") {
        dir('dev') {
            stage('Plan') {
                sh "terraform init"

                if (env.CHANGE_ID) {
                    def plan = sh(script: "terraform plan -no-color", returnStdout: true)
                    // First remove everything from up intill 72 instances of '-'
                    plan -= ~/[\s\S]+?[-]{72}/
                    // Then remove everything from 72 instances of '-' till the
                    // end which should leave use with just the middle section
                    plan -= ~/[-]{72}[\s\S]+$/
                    // Finally remove new lines at start and end
                    plan = plan.trim()
                    def comment = pullRequest.comment("```bash\n${plan}\n```")
                }
                else {
                    sh "terraform plan"
                }
            }

            stage('Apply') {
                if (BRANCH_NAME in ["master"]) {
                    sh "terraform apply --auto-approve"
                    }
                else {
                    println "Skiping as we are not on master"
                }
            }
        }
    }
}
