# Class: do_dns
# ===========================
#
# Full description of class do_dns here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
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
    content => epp('do_dns/dns-update.epp')
    notify  => Exec['update-do-dns'],
  }

  exec { 'update-do-dns':
    command     => $filename,
    refreshonly => true,
  }


}
