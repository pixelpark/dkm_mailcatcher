# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include dkm_mailcatcher
class dkm_mailcatcher (
  Array[String]    $packages,
  String           $ruby_version,
  String           $module_mngmt,
  String           $ensure_state,
  String $ensure_state,
  String $http_addr,
  # String $smtp_addr,
  String $package_provider,
  String $terminal_provider,
  String $command,
) {
  include dkm_mailcatcher::setruby
  include dkm_mailcatcher::install
  include dkm_mailcatcher::run

  Class['mailcatcher::setruby'] -> Class['mailcatcher::install'] -> Class['mailcatcher::run']
}
