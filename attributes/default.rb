#
# Global configuration
#
default['samba']['workgroup'] = 'WORKGROUP'
default['samba']['description'] = '%h server'
default['samba']['backend'] = 'tdbsam'
default['samba']['os_level'] = '255'
default['samba']['log_level'] = '3'
default['samba']['domain_master'] = 'no'
default['samba']['preferred_master'] = 'no'
default['samba']['wins'] = 'yes'
default['samba']['security'] = 'SHARE'
default['samba']['nt_acl_support'] = 'no'
default['samba']['acl_group_control'] = 'no'
default['samba']['time_server'] = 'no'
default['samba']['load_printers'] = 'no'
default['samba']['printcap_name'] = '/dev/null'

# Add configuration default directories in configuration files
default['samba']['default_config_directories'] = false

# If default['samba']['backend'] = 'ldap', these attributes will be active
default['samba']['ldap_server'] = 'ldapserver'
default['samba']['ldap_ssl'] = 'no'
default['samba']['base_dn'] = 'dc=example,dc=com'
default['samba']['admin_dn'] = "cn=manager,#{node['samba']['base_dn']}"
default['samba']['admin_password'] = "password"
default['samba']['user_suffix'] = 'ou=person'
default['samba']['group_suffix'] = 'ou=group'
default['samba']['machine_suffix'] = 'ou=computer'
default['samba']['nss_user'] = "cn=manager,#{node['samba']['base_dn']}"
default['samba']['nss_password'] = 'password'
