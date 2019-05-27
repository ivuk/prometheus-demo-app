require 'spec_helper'

describe package('nginx'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe service('nginx'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe service('prometheus'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe port(443) do
  it { should be_listening }
end

describe port(9090) do
  it { should be_listening }
end

describe file('/usr/local/bin/prometheus') do
  it { should be_symlink }
end

describe file('/usr/local/bin/promtool') do
  it { should be_symlink }
end

describe user('prometheus') do
  it { should exist }
  it { should have_login_shell '/usr/sbin/nologin' }
end

describe file('/var/lib/prometheus') do
  it { should be_directory }
  it { should be_mode '755' }
  it { should be_owned_by 'prometheus' }
  it { should be_grouped_into 'prometheus' }
end

describe file('/etc/prometheus') do
  it { should be_directory }
  it { should be_mode '755' }
  it { should be_owned_by 'root' }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'prometheus' }
end

describe file('/etc/nginx/sites-enabled/nginx-prometheus') do
  it { should be_symlink }
end

describe file('/etc/nginx/sites-available/nginx-prometheus') do
  it { should be_file }
end

describe file('/etc/nginx/htpasswd') do
  it { should be_file }
end

describe command('curl http://localhost') do
    its(:stdout) { should contain('401 Authorization Required') }
end
