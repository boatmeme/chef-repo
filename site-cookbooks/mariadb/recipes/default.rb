#
# Cookbook Name:: mariadb
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
yum_key 'RPM-GPG-KEY-MariaDB' do
  url "http://yum.mariadb.org/RPM-GPG-KEY-MariaDB"
  action :add
end
 
yum_repository 'MariaDB' do
  repo_name 'MariaDB'
  url "http://yum.mariadb.org/10.0.3/centos6-amd64"
  key 'RPM-GPG-KEY-MariaDB'
  action :create
end
 
package 'MariaDB-devel' do
  action :install
end

package 'MariaDB-client' do
  action :install
end

package 'MariaDB-server' do
  action :install
end

service "mysql" do
  supports status: true, restart: true, reload: true
  action   [ :enable, :start ]
end

