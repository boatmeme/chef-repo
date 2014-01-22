require 'spec_helper'

describe command('/usr/local/rbenv/shims/ruby -v') do
  its(:stdout) { should eq "ruby 2.1.0p0 (2013-12-25 revision 44422) [x86_64-linux]\n"}
end
