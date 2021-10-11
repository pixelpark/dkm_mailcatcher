# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include dkm_mailcatcher::setruby
class dkm_mailcatcher::setruby {
  package { 'enable ruby module':
    ensure   => present,
    name     => $dkm_mailcatcher::ruby_version,
    provider => $dkm_mailcatcher::module_mngmt,
    command  => '/usr/bin/dnf'
  }
  
  package { $dkm_mailcatcher::packages:
    ensure => present,
  }
  
  Package['enable ruby module'] -> Package['ruby-devel']
}
