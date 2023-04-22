pipelineJob('theme-park-job') {
    definition {
        cpsScm {
            scm {
                git {
                    remote {
                        url 'https://github.com/devnull789/tkgregory-spring-boot-api-example.git'
                    }
                    branch 'TRIAGE-jenkinsfile-docker'
                    scriptPath('Jenkinsfile-docker')
                }
            }
        }
    }
}


