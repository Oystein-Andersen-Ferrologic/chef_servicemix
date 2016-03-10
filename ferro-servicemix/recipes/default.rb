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

#docker_image 'hub.docker.com/r/ferrologic/servicemix' do
#  tag '6.1.0-prod'
#  action :pull
#end

docker_image 'mkroli/servicemix' do
  tag 'latest'
  action :pull
end

docker_container 'chef_servicemix' do
  #repo 'ferrologic/servicemix'
  repo 'mkroli/servicemix'
  tag 'latest'
  port ['8181:8181','8101:8101','61616:61616']
  volumes ['/home/oystein/chef_servicemix_in:/in','/home/oystein/chef_servicemix_out:/out']
  action :run
end
