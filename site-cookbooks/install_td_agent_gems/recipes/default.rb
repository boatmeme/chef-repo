#
# Cookbook Name:: install_td_agent_gems
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
gems = [
  'fluent-plugin-mysqlslowquery',
  'fluent-plugin-redis',
  'fluent-plugin-elasticsearch'
]

gems.each do |g|
  gem_package "#{g}" do
    gem_binary "/usr/lib64/fluent/ruby/bin/fluent-gem"
    action :install
  end
end

