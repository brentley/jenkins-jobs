// This job will run the required jobs that are necessary in order
node() {
    stage 'Building Registry'
    build job: 'generate_jenkins_jobs', parameters: [[$class: 'StringParameterValue', name: 'JOB', value: '**/*registry.dsl']]
    build job: 'registry_pipeline'

    stage 'Building Git Service'
    build job: 'generate_jenkins_jobs', parameters: [[$class: 'StringParameterValue', name: 'JOB', value: '**/*gitserver.dsl']]
    build job: 'git-server_pipeline'

    stage 'Building Kafka'
    build job: 'generate_jenkins_jobs', parameters: [[$class: 'StringParameterValue', name: 'JOB', value: '**/*kafka.dsl']]
    build job: 'kafka_pipeline'

    stage 'Building Chronos'
    build job: 'generate_jenkins_jobs', parameters: [[$class: 'StringParameterValue', name: 'JOB', value: '**/*chronos.dsl']]
    build job: 'chronos_pipeline'

    // At this point all other jenkins jobs defined in repos.json will be built and will run based on scm polling
    stage 'Building all other jenkins jobs'
    build job: 'generate_jenkins_jobs'
}
