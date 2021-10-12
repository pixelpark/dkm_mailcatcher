# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mailcatcher
class mailcatcher (
  Array[String]    $packages,
  String           $ruby_version,
  String           $module_mngmt,
  String           $ensure_state,
  String           $http_addr,
  # String         $smtp_addr,
  String           $package_provider,
  String           $terminal_provider,
  String           $command,
  String           $target_path,
  String           $service_desc,
  String           $service_doc,
  String           $service_start,
  String           $service_type,
  String           $service_cmd,
  String           $service_restart,
  String           $service_wanted,
) {
  include mailcatcher::setruby
  include mailcatcher::install
  include mailcatcher::run
  include mailcatcher::systemdunit

  Class['mailcatcher::setruby'] -> Class['mailcatcher::install'] -> Class['mailcatcher::run']
}
