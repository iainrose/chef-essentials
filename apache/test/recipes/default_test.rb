# # encoding: utf-8

# Inspec test for recipe apache::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

unless os.windows?
  describe user('root') do
    it { should exist }
  end
end

describe port(80) do
  it { should be_listening }
end

describe package('httpd') do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/var/www/html/index.html') do
  its('content') { should match(/Hello, world!/) }
end

describe command('curl localhost') do
   its('stdout') { should match ('<h1>Hello, world!</h1>') }
end
