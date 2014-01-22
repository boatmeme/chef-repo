require 'spec_helper'

describe command('/usr/local/bin/git --version') do
  its(:stdout) { should match 'git version 1.8.5.3'}
end
