# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mailcatcher::setruby
class mailcatcher::setruby {
  package { 'ruby':
    ensure   => $mailcatcher::ruby_version,
    provider => $mailcatcher::module_mngmt,
  }
  package { $mailcatcher::packages:
    ensure => present,
  }

  Package['ruby'] -> Package['ruby-devel']
}
