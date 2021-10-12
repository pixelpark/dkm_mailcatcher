# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mailcatcher::install
class mailcatcher::install {
  package { 'mailcatcher':
    ensure   => $mailcatcher::ensure,
    provider => $mailcatcher::package_provider,
    command  => '/usr/bin/gem',
    require  => Class['mailcatcher::setruby'],
  }
}
