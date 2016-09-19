# == Class do_dns::params
#
# This class is meant to be called from do_dns.
# It sets variables.
#
class do_dns::params {
  $api_key  = ''
  $dns_zone = ''
  $filename = '/usr/local/bin/set_do_dns.sh'
}
