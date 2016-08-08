import groovy.json.JsonSlurper

streamFileFromWorkspace('./repos.json').withReader { j ->
    def slurper = new JsonSlurper()
    def jsonText = j.getText()
    projects = slurper.parseText(jsonText)
    
    projects.each { projName, details ->
        pipelineJob(projName) {
            definition {
                cpsScm {
                    scm {
                        gitSCM {
                            userRemoteConfigs {
                                userRemoteConfig {
                                    name(null)
                                    refspec(null)
                                    url(details.url)
                                    credentialsId('ng')
                                }
                            }
                            branches {
                                branchSpec {
                                    name('*/' + details.branch)
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
                    scm('H/5 * * * *')
                }
            }
        }
    }
}
