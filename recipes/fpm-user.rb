#
# Cookbook Name:: basic-lamp-lemp
# Recipe:: fpm-user
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
#
# Cookbook Name:: basic-lamp-lemp
# Recipe:: httpd-user
#
# Copyright (c) 2015 Artist IO, All Rights Reserved.
#
# This recipe will create user for php-fpm

group node['basic-lamp-lemp']['php-fpm-group']

user node['basic-lamp-lemp']['php-fpm-user'] do
  group node['basic-lamp-lemp']['php-fpm-group']
  system true
  shell '/bin/bash'
end
