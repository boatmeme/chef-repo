#
# Cookbook Name:: change_permission_slow_log_file
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
file "/var/log/mysql/mysqld-slow.log" do
  mode "0666"
  action :touch
end
