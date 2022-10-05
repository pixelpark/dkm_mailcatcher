# @summary Installer for the mailcatcher
class mailcatcher::install {
  assert_private()

  package { $mailcatcher::packages:
    ensure => present,
  }
  -> package { 'mailcatcher':
    ensure   => $mailcatcher::ensure_state,
    provider => $mailcatcher::package_provider,
    command  => '/usr/bin/gem',
  }
}
