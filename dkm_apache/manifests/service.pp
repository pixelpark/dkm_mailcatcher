# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include dkm_apache::service
class dkm_apache::service {
    service { $dkm_apache::service:
      ensure => $dkm_apache::status,
      enable => true,
    }
}
