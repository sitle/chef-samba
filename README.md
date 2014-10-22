# Samba-cookbook

This cookbook install and configure files server based on SAMBA.

## Supported Platforms

* Debian 7

## Attributes

| Key | Type |  Description | Default |
| -------- | -------- | -------- | -------- |
| ['samba']['workgroup'] | string | Default workgroup | WORKGROUP |
| ['samba']['description'] | string | Default comment | '%h server' |
| ['samba']['backend'] | string | Default backend (can be tdbsam or ldap) | tdbsam |
| ['samba']['os_level'] | string | OS level | 255 |
| ['samba']['log_level'] | string | Log level | 3 |
| ['samba']['domain_master'] | string | Domain master | no |
| ['samba']['preferred_master'] | string | preferred master | no |
| ['samba']['wins'] | string | wins support | yes |
| ['samba']['security'] | string | default security | SHARE |
| ['samba']['nt_acl_support'] | string | nt acl support | no |
| ['samba']['acl_group_control'] | string | acl group control | no |
| ['samba']['time_server'] | string | time server support | no |
| ['samba']['load_printers'] | string | load printer | no |
| ['samba']['printcap_name'] | string | printcap file path | '/dev/null' |
| ['samba']['default_config_directories'] | boolean | activate the default configuration | false |
| ['samba']['ldap_server'] | string | LDAP Hostname | ldapserver |
| ['samba']['ldap_ssl'] | string | LDAP SSL support | no |
| ['samba']['base_dn'] | string | Base DN | 'dc=example,dc=com' |
| ['samba']['admin_dn'] | string | Samba LDAP account | "cn=manager,#{node['samba']['base_dn']}" |
| ['samba']['admin_password'] | string | Samba LDAP password | 'password' |
| ['samba']['user_suffix'] | string | user suffix | 'ou=person' |
| ['samba']['group_suffix'] | string | group suffix | 'ou=group' |
| ['samba']['machine_suffix'] | string | computer suffix | 'ou=computer' |
| ['samba']['nss_user'] | string | NSS account | "cn=manager,#{node['samba']['base_dn']}" |
| ['samba']['nss_password'] | string | NSS password | 'password' |

## Usage

The default recipe does nothing, you must use server or client recipes. If you activate the ldap backend, you must set all the ldap attributes.

### samba::server

Include `samba` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[samba::server]"
  ]
}
```

### samba::client

Include `samba` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[samba::client]"
  ]
}
```

## License and Authors

Author : Léonard TAVAE (<leonard.tavae@informatique.gov.pf>)

```text
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
```