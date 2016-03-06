#
# Cookbook Name:: basic-lamp-lemp
# Recipe:: php-fpm
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'php5-fpm::install'

# Adding section to delete the www.conf in order not to run default pool

php5_fpm_pool "www" do
    overwrite 'true'
    pool_user node['basic-lamp-lemp']['php-fpm-user']
    pool_group node['basic-lamp-lemp']['php-fpm-group']
    listen_address "127.0.0.1"
    listen_port 8000
    listen_allowed_clients "127.0.0.1"
    listen_owner "nobody"
    listen_group "nobody"
    listen_mode "0666"
    pm_max_children 10
    pm_start_servers 1
    pm_min_spare_servers 1
    pm_max_spare_servers 5
    pm_process_idle_timeout "30s"
    pm_max_requests 1000
    php_ini_flags (
                    { "display_errors" => "off", "log_errors" => "on"}
                  )
    php_ini_values (
                      { "sendmail_path" => "/usr/sbin/sendmail -t -i -f www@my.domain.com", "memory_limit" => "32M"}
                  )
    overwrite true
    action :create
end
