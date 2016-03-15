
#
# Cookbook Name:: ferro-servicemix
# Recipe:: startserver
#
# Copyright 2016, Ferrologic
#
# All rights reserved - Do Not Redistribute
#




docker_container 'chef_servicemix' do
  #repo 'ferrologic/servicemix'
  repo 'mkroli/servicemix'
  tag 'latest'
  port ['8181:8181','8101:8101','61616:61616']
  volumes ['/tmp/deploy:/deploy']
  action :run
end
