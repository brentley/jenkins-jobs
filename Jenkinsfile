// This job will run the required jobs that are necessary in order
node() {
    stage 'Building Registry'
    build job: 'registry_pipeline'

    stage 'Building Git Service'
    build job: 'git-server_pipeline'

    stage 'Building Kafka'
    build job: 'kafka_pipeline'

    stage 'Building Chronos'
    build job: 'chronos_pipeline'

    stage 'Building Ninjas'
    build job: 'ninjas_pipeline'

    stage 'Building Agent Events Collector'
    build job: 'agent_events_collector_pipeline'

    stage 'Building Agent Events Router'
    build job: 'agent-events-router_pipeline'

    stage 'Building Kafka to ES'
    build job: 'kafka-to-es_pipeline'
}
