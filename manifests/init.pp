# @summary A class for mailcatching
#
# The software catches mail before are they send out and redirect to a UI.
# These mails will never leave the host.
#
# @param packages
#   list of packages to be installed
# @param ruby_version
#   required ruby version
# @param module_mngmt
#   dnfmodule: manage the ruby modules
# @param ensure_state
#   state of the packages (installed)
# @param package_provider
#   provider to install ruby
# @param terminal_provider
#   terminal to be use: shell
# @param http_addr
#   custom address where the app should listen
#   Default: 127.0.0.1
# @param http_port
#   custom port for the application
#   Default: 8010
# @param smtp_addr
#   custom smtp address
#   Default: 127.0.0.1
# @param smtp_port
#   custom smtp port
#   Default: 2510
class mailcatcher (
  Array[String] $packages,
  String        $ruby_version,
  String        $module_mngmt,
  String        $ensure_state,
  String        $package_provider,
  String        $terminal_provider,
  Optional[Stdlib::IP::Address] $http_addr = undef,
  Optional[Stdlib::Port]        $http_port = undef,
  Optional[Stdlib::IP::Address] $smtp_addr = undef,
  Optional[Stdlib::Port]        $smtp_port = undef,
) {
  case $facts['os']['family'] {
    'RedHat': {
      unless $facts['os']['release']['major'] >= '7' {
        fail("The os release (${facts['os']['family']} ${facts['os']['release']['major']}) is not supported yet.")
      }

      if $facts['os']['release']['major'] >= '8' {
        include mailcatcher::setruby

        Class['mailcatcher::setruby']
        -> Class['mailcatcher::install']
      }

      include mailcatcher::install
      include mailcatcher::systemdunit

      Class['mailcatcher::install']
      -> Class['mailcatcher::systemdunit']
    }
    default: {
      fail("The distro (${facts['os']['family']}) is not supported yet.")
    }
  }
}
