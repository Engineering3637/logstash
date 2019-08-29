#
# Cookbook:: logstash
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.


apt_update 'update_sources' do
  action :update
end
#
# package 'logstash' do
#   # options '--allow-unauthenticated'
#   action :install
# end
#
# service 'logstash' do
#   action [:enable, :start]
# end
# install logstash 'server'

name = 'server'

logstash_instance name do
  action :create
end

logstash_service name do
  action [:enable]
end

logstash_config name do
  action [:create]
  notifies :restart, "logstash_service[#{name}]"
end

logstash_plugins 'contrib' do
  instance name
  name 'logstash-output-influxdb'
  action [:create]
end

logstash_pattern name do
  action [:create]
end

logstash_curator 'server' do
  action [:create]
end
