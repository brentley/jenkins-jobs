pipelineJob('chronos_pipeline') {
    definition {
        cpsScm {
            scm {
                gitSCM {
                    userRemoteConfigs {
                        userRemoteConfig {
                            name(null)
                            refspec(null)
                            url('ssh://git@git-server.marathon.mesos:10022/home/git/chronos')
                            credentialsId('ng')
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
