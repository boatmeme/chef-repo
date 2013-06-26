#
# Cookbook Name:: ruby-rbenv
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
install_gem_list = [
  "bundler",
  "pry",
  "zeus"
]

install_gem_list.each do |g|
  gem_package "#{g}" do
    gem_binary "/usr/local/rbenv/shims/gem"
    options "--no-rdoc --no-ri"
    action :install
  end
end

execute "rbenv_rehash" do
  command "source /etc/profile.d/rbenv.sh; rbenv rehash"
  action :run
end
