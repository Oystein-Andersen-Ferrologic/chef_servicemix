#
# Cookbook Name:: ferro-servicemix
# Recipe:: default
#
# Copyright 2016, Ferrologic
#
# All rights reserved - Do Not Redistribute
#

docker_service 'default' do
  action [:create ]
end

docker_registry 'https://registry.hub.docker.com' do
  username 'oysteinandersenferrologic'
  password 'dcCl84t5PxSnSSy1cmwI'
end

#docker_image 'hub.docker.com/r/ferrologic/servicemix' do
#  tag '6.1.0-prod'
#  action :pull
#end

docker_image 'mkroli/servicemix' do
  tag 'latest'
  action :pull_if_missing
end
