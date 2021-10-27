# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mailcatcher::service
class mailcatcher::service {
  service { $mailcatcher::service_name:
    ensure    => $mailcatcher::service_status,
    enable    => $mailcatcher::service_state,
    hasstatus => true,
  }
}
