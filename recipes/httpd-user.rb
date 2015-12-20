#
# Cookbook Name:: basic-lamp-lemp
# Recipe:: httpd-user
#
# Copyright (c) 2015 Artist IO, All Rights Reserved.
#
# This recipe will create user for httpd (NGINX or Apache)

group node['basic-lamp-lemp']['httpd-group']

user node['basic-lamp-lemp']['httpd-user'] do
  group node['basic-lamp-lemp']['httpd-group']
  system true
  shell '/bin/bash'
end
