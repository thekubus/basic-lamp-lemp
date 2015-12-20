#
# Cookbook Name:: basic-lamp-lemp
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt::default'
include_recipe 'basic-lamp-lemp::httpd-user'
