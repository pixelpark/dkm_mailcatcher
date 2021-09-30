# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include dkm_mailcatcher
class dkm_mailcatcher (
  String[1]            $ruby_version,
  Stdlib::Absolutepath $gem_path,
  String               $ensure_state,
  String               $http_addr,
  # String               $smtp_addr,
  String               $package_provider,
  String               $terminal_provider,
  String               $command,
) {

  class {'corp104_rvm':
    ruby_version => $ruby_version,
  }

  include dkm_mailcatcher::install
  include dkm_mailcatcher::run

  Class['Corp104_rvm'] -> Class['dkm_mailcatcher::install'] -> Class['dkm_mailcatcher::run']
}
