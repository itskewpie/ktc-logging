#
# Attributes for ipc_ng environment
#
return unless chef_environment == "ipc_ng"

include_attribute "ktc-logging::default"

default[:logging][:recipes_server_logstash] = %w{
  ktc-logging::logstash
}

default[:logging][:recipes_server_es] = %w{
  java
  elasticsearch::default
  logstash::default
  logstash::index_cleaner
  kibana::default
}

default[:logging][:recipes_server_kibana] = %w{
}

default[:logging][:recipes_client] = %w{
  ktc-rsyslog::default
}

# Logstash attributes
default[:logstash][:splunk_host] = '10.2.2.81'
default[:logstash][:splunk_port] = '4109'
default[:logstash][:elasticsearch_cluster] = 'es-cluster-ipc-ng'
default[:elasticsearch][:cluster][:name] = 'es-cluster-ipc-ng'

# TODO: This endpoint should be handled with Services library in ktc-rsyslog.
default[:rsyslog][:logstash_server] = 'logstash01-vm.mgmt1.ipc-ng'

# process monitoring
default[:logging][:server][:logstash_processes] = [
  { "name" =>  "java", "shortname" =>  "java" }
]

default[:logging][:server][:es_processes] = [
  { "name" =>  "java", "shortname" =>  "java" },
  { "name" =>  "apache2", "shortname" =>  "apache2" }
]

default[:logging][:server][:kibana_processes] = [
]
