import groovy.json.JsonSlurper

File f = new File('repos.json')
def slurper = new JsonSlurper()
def jsonText = f.getText()
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
