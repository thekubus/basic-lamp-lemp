default['basic-lamp-lemp']['httpd-user'] = 'web_admin'
default['basic-lamp-lemp']['httpd-group'] = 'web_admin'

default['basic-lamp-lemp']['document_root'] = '/var/www/default/public_html'

default['basic-lamp-lemp']['passwords']['secret_path'] = '/etc/chef/secret/mysql_secret'
default['basic-lamp-lemp']['php-fpm-user'] = 'fpm_user'
default['basic-lamp-lemp']['php-fpm-group'] = 'fpm_group'
