import groovy.json.JsonSlurper
import hudson.FilePath

hudson.FilePath workspace = hudson.model.Executor.currentExecutor().getCurrentWorkspace()
File f = new File("${workspace}/repos.json")

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
