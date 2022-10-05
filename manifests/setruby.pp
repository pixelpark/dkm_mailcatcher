# @summary Class to ensure the needed ruby version
class mailcatcher::setruby {
  assert_private()

  package { 'ruby':
    ensure   => $mailcatcher::ruby_version,
    provider => $mailcatcher::module_mngmt,
  }

  Package['ruby']
  -> Package['ruby-devel']
}
