#
# Cookbook Name:: mysql
# Recipe:: default
# Os:: CentOS 6.4
#
directory "/tmp/mysql" do
  owner "root"
  group "root"
  mode 0777
  action :create
end

rpm_list = {
  "MySQL-shared-compat-5.6.12-1.el6.x86_64.rpm" => "77f1e3f29617b7e7e957262ef466a66278c1105a6e2f075d4174b98a706013b3",
  "MySQL-client-5.6.12-1.el6.x86_64.rpm" => "cde08a56279e17b41bac3d1ac9fee80f81c8bb60635e5fbfdb3ca5ace331522a",
  "MySQL-server-5.6.12-1.el6.x86_64.rpm" => "d8ead0bb2fbf7f23c75d8d025a3cc9cabd0c37768d494000d5b74aad364459a6",
  "MySQL-devel-5.6.12-1.el6.x86_64.rpm" => "ffdcd22345030c916fa836605efc7fa7eb6fbf5ccb2fce8835c7ea9d18278b1a",
  "MySQL-embedded-5.6.12-1.el6.x86_64.rpm" => "2765b953a05c5cc528d6c437999a85e382cabcf321ebc15e8ae9680bbefca9c2",
  "MySQL-shared-5.6.12-1.el6.x86_64.rpm" => "b8ade6c0b5cbba4ef4e08a05a6b0b628d2a514299face54cde190cbfe2d7aef9",
  "MySQL-test-5.6.12-1.el6.x86_64.rpm" => "122e76bb1cb01ecbb32fd778c3907c3429d7124fb85d3febccac0df77bd9c845"
}

rpm_list.each do |filename, checksum|
  cookbook_file "/tmp/mysql/#{filename}" do
    source "#{filename}"
    checksum "#{checksum}"
  end

  package "#{filename}" do
    action :install
    source "/tmp/mysql/#{filename}"
    provider Chef::Provider::Package::Rpm
  end
end

service "mysql" do
  supports status: true, restart: true, reload: true
  action   [ :enable, :start ]
end

