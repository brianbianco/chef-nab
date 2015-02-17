#
# Cookbook Name:: nab
# Recipe:: default
#

%w(openssl libssl-dev libxml2 build-essential).each do |p|
  package p do
    action :install
  end
end

install_version = node['nab']['installs']['version']

if node['nab']['installs']['gem']
  gem_package 'nab' do
    action :install
    version install_version if install_version
  end
end

if node['nab']['installs']['chef_gem']
  chef_gem 'nab' do
    action :install
    version install_version if install_version
  end
end
