# Class: do_dns
# ===========================
#
# Uses the Digital Ocean metadata of your droplet and issues an api curl command to set the dns record based on the droplet's hostname.
#
# Parameters
# ----------
#
# * `api_key`
# This is your Digital Ocean API key for managing DNS records
#
# * `dns_zone`
#This is the domain zone you want to update.
#
# * `filename` (optional)
#This is an optional setting. Configures the filename of the script to execute. Useful if you need to update the DNS record.
#
#
class do_dns (
  $api_key  = $::do_dns::params::api_key,
  $dns_zone = $::do_dns::params::dns_zone,
  $filename = $::do_dns::params::filename,
) inherits ::do_dns::params {

  if ($api_key == '') {
      fail('api_key must be set')
  }

  if ($dns_zone == '') {
      fail('dns_zone must be configured for the zone file you need to change')
  }

  file { $filename:
    ensure  => file,
    mode    => '0755',
    content => epp('do_dns/dns-update.epp'),
    notify  => Exec['update-do-dns'],
  }

  exec { 'update-do-dns':
    command     => $filename,
    refreshonly => true,
  }


}
