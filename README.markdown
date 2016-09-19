#### Table of Contents

1. [Overview](#overview)
2. [Description](#module-description)
3. [Setup - The basics of getting started with do_dns](#setup)
    * [What do_dns affects](#what-do_dns-affects)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Grabs the Digital Ocean public IP address and points it to a Digital Ocean DNS record using the `$::hostname` fact.       

## Module Description

Uses the Digital Ocean metadata of your droplet and issues an api curl command to set the dns record based on the droplet's hostname.

## Setup

### What do_dns affects

* creates /usr/local/bin/set_do_dns.sh and executes it.

## Usage

```puppet
class {'do_dns':
  api_key  => 'xxxxx',
  dns_zone => 'domain.tld',
}
```

This will ensure `$::hostname.domain.tld` points to this droplet.

## Reference

### api_key

This is your Digital Ocean API key for managing DNS records

### dns_zone

This is the domain zone you want to update.

### filename (optional)

This is an optional setting. Configures the filename of the script to execute. Useful if you need to update the DNS record.

## Limitations

Only works on Digital Ocean Droplets and Digital Ocean DNS. Requires `curl` and Puppet 4.x (or 3.5+ with future parser).

## Development

See CONTRIBUTING.md
