# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include dkm_apache::install
class dkm_apache::install {
    package { $dkm_apache::package:
      ensure => $dkm_apache::state,
    }
}
