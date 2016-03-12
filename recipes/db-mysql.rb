#
# Cookbook Name:: basic-lamp-lemp
# Recipe:: db-mysql
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Configure the mysql2 Ruby gem.
mysql2_chef_gem 'default' do
  action :install
end

# Configure the MySQL client.
mysql_client 'default' do
  action :create
end

# Load the secrets file and the encrypted data bag item that holds the root password.
#password_secret = Chef::EncryptedDataBagItem.load_secret(node['basic-lamp-lemp']['passwords']['secret_path'])
#root_password_data_bag_item = Chef::EncryptedDataBagItem.load('passwords', 'mysql_root_password', password_secret)

# Configure the MySQL service.
mysql_service 'default' do
  initial_root_password 'hastolavisto'
  action [:create, :start]
end

mysql_config 'default' do
  source 'innodb.cnf.erb'
  notifies :restart, 'mysql_service[default]'
  action :create
end
