#
# Cookbook Name:: basic-lamp-lemp
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt::default'
include_recipe 'basic-lamp-lemp::httpd-user'

# Install Apache and start the service.
httpd_service 'default' do
  keepalivetimeout '15'
  minspareservers '1'
  maxspareservers '3'
  maxclients '10'
  maxconnectionsperchild '3000'
  mpm 'prefork'
  action [:create, :start]
end

# Add the site configuration.
httpd_config 'default' do
  instance 'default'
  source 'httpd.conf.erb'
  notifies :restart, 'httpd_service[default]'
end

# Create the document root directory.
directory node['basic-lamp-lemp']['document_root'] do
  recursive true
end

# Write a default home page.
file "#{node['basic-lamp-lemp']['document_root']}/index.php" do
  content '<html>This is a placeholder</html>'
  mode '0644'
  owner node['basic-lamp-lemp']['httpd-user']
  group node['basic-lamp-lemp']['httpd-group']
end
