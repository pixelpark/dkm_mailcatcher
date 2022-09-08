# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mailcatcher
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
# @param service_desc
#   systemctl unit service description
# @param service_doc
#   url to service documentation
# @param service_after
#   service option for systemctl unit
# @param service_type
#   type of service for systemctl unit
# @param service_restart
#   systemctl unit restart option
# @param service_wanted
#   systemctl unit option
# @param service_restart_time
#   systemctl unit option
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
  String        $service_desc,
  String        $service_doc,
  String        $service_after,
  String        $service_type,
  String        $service_restart,
  String        $service_wanted,
  String        $service_restart_time,
  Optional[Stdlib::IP::Address] $http_addr = undef,
  Optional[Stdlib::Port]        $http_port = undef,
  Optional[Stdlib::IP::Address] $smtp_addr = undef,
  Optional[Stdlib::Port]        $smtp_port = undef,
) {
  case $facts['os']['family'] {
    'RedHat': {
      if $facts['os']['release']['major'] >= '8' {
        include mailcatcher::install
        include mailcatcher::systemdunit

        Class['mailcatcher::setruby']
        -> Class['mailcatcher::install']
        -> Class['mailcatcher::systemdunit']
      }
      if $facts['os']['release']['major'] >= '8' {
        include mailcatcher::setruby
        include mailcatcher::install
        include mailcatcher::systemdunit

        Class['mailcatcher::setruby']
        -> Class['mailcatcher::install']
        -> Class['mailcatcher::systemdunit']
      }
    } default: {
      notify {'Your distro is not supported yet.': }
    }
  }
}
