#
# Cookbook Name:: ferro-servicemix
# Recipe:: default
#
# Copyright 2016, Ferrologic
#
# All rights reserved - Do Not Redistribute
#

docker_service 'default' do
  action [:create, :start]
end

docker_registry 'https://registry.hub.docker.com' do
  username 'oysteinandersenferrologic'
  password 'dcCl84t5PxSnSSy1cmwI'
  email 'oystein.andersen@ferrologic.se'
end

docker_image 'ferrologic/servicemix' do
  tag '6.1.0-prod'
  action :pull_if_missing
end

docker_container 'chef_servicemix' do
  repo 'ferrologic/servicemix'
  tag '6.1.0-prod'
  port ['8181:8181','8101:8101','61616:61616']
  volumes ['/home/oystein/deploy:/opt/servicemix/deploy','/home/oystein/in:/in','/home/oystein/out:/out']
  links ['postgres:postgres']
  action :run
end
