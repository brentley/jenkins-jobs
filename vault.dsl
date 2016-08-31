pipelineJob('vault-seal-monitor') {
    definition {
        cpsScm {
            scm {
                gitSCM {
                    userRemoteConfigs {
                        userRemoteConfig {
                            name(null)
                            refspec(null)
                            url('https://github.com/adamjkeller/vault-ecs.git')
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
        triggers {
            cron('H/5 * * * *')
        }
    }
}
