# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mailcatcher::setruby
class mailcatcher::setruby {
  package { 'enable ruby module':
    ensure   => present,
    name     => $mailcatcher::ruby_version,
    provider => $mailcatcher::module_mngmt,
  }
  package { $mailcatcher::packages:
    ensure => present,
  }

  Package['enable ruby module'] -> Package['ruby-devel']
}
