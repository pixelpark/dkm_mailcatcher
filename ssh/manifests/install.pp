# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ssh::install
class ssh::install {
  package { $ssh::install::packages:
    ensure => $ssh::packages_state,
  }
}
