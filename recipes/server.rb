#
# Cookbook Name:: samba
# Recipe:: server
#
# Copyright (C) 2014 Leonard TAVAE
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe 'samba::client'

%w(samba unscd acl).each do |pkg|
  package pkg do
    action :install
  end
end

template '/etc/samba/smb.conf' do
  source 'smb.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  notifies :restart, 'service[samba]'
end

if node['samba']['backend'] == 'ldap'
  node.set['openldap']['basedn'] = node['samba']['base_dn']
  node.set['openldap']['server'] = node['samba']['ldap_server']
  node.set['openldap']['nss_user'] = node['samba']['nss_user']
  node.set['openldap']['nss_password'] = node['samba']['nss_password']

  include_recipe 'openldap::auth'

  execute "smbpasswd -w #{node['samba']['admin_password']}" do
    command "smbpasswd -w #{node['samba']['admin_password']}"
    action :run
    notifies :restart, 'service[samba]'
  end
end

service 'samba' do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end

directory '/var/spool/samba' do
  owner 'root'
  group 'root'
  mode '0775'
  action :create
end

directory '/var/spool/samba/travail' do
  owner 'root'
  group 'Domain\ Admins'
  mode '0770'
  action :create
end
