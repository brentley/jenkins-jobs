pipelineJob('git-server_pipeline') {
    definition {
        cpsScm {
            scm {
                gitSCM {
                    userRemoteConfigs {
                        userRemoteConfig {
                            name(null)
                            refspec(null)
                            url('https://github.com/brentley/git-server.git')
                            credentialsId(null)
                        }
                    }
                    branches {
                        branchSpec {
                            name('*/master')
                        }
                    }
                    doGenerateSubmoduleConfigurations(null)
                    browser(null)
                    gitTool(null)
                    extensions {
                        cleanBeforeCheckout()
                    }
                }
            }
            scriptPath('Jenkinsfile')
        }
    }
}
