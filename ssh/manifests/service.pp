# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ssh::service
class ssh::service {
  service { $ssh::service:
    ensure     => $ssh::service_state,
    status     => $ssh::service_status,
    hasrestart => true,
    hasstatus  => true,
  }
}
