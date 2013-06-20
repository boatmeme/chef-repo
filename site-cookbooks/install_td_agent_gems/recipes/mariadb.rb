#
# Cookbook Name:: install_td_agent_gems
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
gems = [
  'fluent-plugin-mysql'
]

gems.each do |g|
  gem_package "#{g}" do
    gem_binary "/usr/lib64/fluent/ruby/bin/fluent-gem"
    action :install
  end
end

# ローカルのビルド済みのgemをアップロード
cookbook_file "/tmp/fluent-plugin-mysqlslowquerylog-custom.tar" do
  source "fluent-plugin-mysqlslowquerylog-custom.tar"
  checksum "1c97636b19a02b6b1ab088038393bd190b69d6366dad5f477ce12f5d6940b588"
end

script "open fluent-plugin-mysqlslowquerylog-custom" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar xvf fluent-plugin-mysqlslowquerylog-custom.tar
    chmod 755 fluent-plugin-mysqlslowquerylog-custom/fluent-plugin-mysqlslowquerylog-custom-0.0.1.gem
    /usr/lib64/fluent/ruby/bin/fluent-gem i /tmp/fluent-plugin-mysqlslowquerylog-custom/fluent-plugin-mysqlslowquerylog-custom-0.0.1.gem
  EOH
end

