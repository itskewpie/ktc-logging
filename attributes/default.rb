include_attribute "logstash"
include_attribute "elasticsearch"
include_attribute "kibana"
include_attribute "ktc-rsyslog"

# Override these recipe lists in 'per-env' attribute file.
default[:logging][:recipes_server_logstash] = %w{
}

default[:logging][:recipes_server_es] = %w{
}

default[:logging][:recipes_server_kibana] = %w{
}

default[:logging][:recipes_client] = %w{
}

# Logstash attributes
default[:logstash][:server][:version] = '1.2.1'
default[:logstash][:server][:enable_embedded_es] = false
default[:logstash][:server][:source_url] =
  'https://download.elasticsearch.org/logstash/logstash/logstash-1.2.1-flatjar.jar'
default[:logstash][:server][:inputs] = [:syslog => { :type=>'syslog', :port=>'5514' }]
default[:logstash][:server][:outputs] = []

default[:logstash][:server][:filter_list] = ["dmesg", "json_tag", "json_parse"]

default[:logstash][:index_cleaner][:days_to_keep] = 28
default[:logstash][:index_cleaner][:cron][:minute] = '0'
default[:logstash][:index_cleaner][:cron][:hour] = '1'
default[:logstash][:index_cleaner][:cron][:log_file] = '/dev/null'

default[:logstash][:splunk_host] = ''
default[:logstash][:splunk_port] = ''

# These two attributes should have same value.
default[:logstash][:elasticsearch_cluster] = ''
default[:elasticsearch][:cluster][:name] = ''

# Kibana attributes
default[:kibana][:webserver] = 'apache'
default[:kibana][:apache][:enable_default_site] = true

# Rsyslog attributes
default[:rsyslog][:logstash_server] = ''

# process monitoring
default[:logging][:server][:logstash_processes] = [
]

default[:logging][:server][:es_processes] = [
]

default[:logging][:server][:kibana_processes] = [
]
