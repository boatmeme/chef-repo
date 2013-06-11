#
# Cookbook Name:: redhat-lsb
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "redhat-lsb" do
  action :install
end

ohai "reload" do
  action :reload
end
