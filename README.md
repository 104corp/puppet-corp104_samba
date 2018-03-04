# puppet module corp104_samba
[![Build Status](https://travis-ci.org/104corp/puppet-corp104_samba.svg?branch=master)](https://travis-ci.org/104corp/puppet-corp104_samba)


#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with corp104_samba](#setup)
    * [Beginning with corp104_samba](#beginning-with-corp104_samba)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The corp104_samba module installs, configures, and manages the corp104_samba service across a range of operating systems and distributions.

## Setup

### Beginning with corp104_samba

`include '::corp104_samba'` is enough to get you up and running.

## Usage

All parameters for the ntp module are contained within the main `::corp104_samba` class, so for any function of the module, set the options you want. See the common usages below for examples.

### Install and enable corp104_samba

```puppet
include '::corp104_samba'
```

### Generate samba share

```puppet
corp104_samba::share { 'share-sample':
  comment        => 'This share sample',
  path           => '/tmp',
  writable       => true,
  browseable     => true,
  create_mask    => '0644',
  directory_mask => '0755',
  valid_users    => 'smbuser',
  hosts_deny     => ['All'],
  hosts_allow    => ['192.168.0.2'],
}
```

## Reference

### Classes

#### Public classes

* corp104_samba: Main class, includes all other classes.

#### Private classes

* corp104_samba Handles global config.
* corp104_samba::install Handles the install.
* corp104_samba::config Handles the config.
* corp104_samba::service Handles the service.
* corp104_samba::share Handles the share config.

## Limitations

This module cannot guarantee installation of corp104_samba versions that are not available on  platform repositories.

This module is officially [supported](https://forge.puppetlabs.com/supported) for the following Java versions and platforms:

## Development

Puppet modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great. Please follow our guidelines when contributing changes.

For more information, see our [module contribution guide.](https://docs.puppetlabs.com/forge/contributing.html)

### Contributors

To see who's already involved, see the [list of contributors.](https://github.com/puppetlabs/puppetlabs-ntp/graphs/contributors)
