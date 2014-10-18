# Samba-cookbook

This cookbook install and configure shared files service.

## Supported Platforms

* Debian 7

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['samba']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### samba::default

Include `samba` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[samba::default]"
  ]
}
```

## License and Authors

Author : Leonard TAVAE (<leonard.tavae@informatique.gov.pf>)
