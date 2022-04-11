# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mailcatcher
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
       include mailcatcher::setruby
       include mailcatcher::install
       include mailcatcher::systemdunit

       Class['mailcatcher::setruby']
         -> Class['mailcatcher::install']
         -> Class['mailcatcher::systemdunit']
     }
  } default: {
      notify {"Your distro is not supported yet.": }
    }
  }
}
