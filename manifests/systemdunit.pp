# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mailcatcher::systemdunit
class mailcatcher::systemdunit {
  if $mailcatcher::http_addr {
    $http_addr = "--http-ip ${mailcatcher::http_addr}"
  }
  if $mailcatcher::http_port {
    $http_port = "--http-port ${mailcatcher::http_port}"
  }
  if $mailcatcher::smtp_addr {
    $smtp_addr = "--smtp-ip ${mailcatcher::smtp_addr}"
  }
  if $mailcatcher::smtp_port {
    $smtp_port = "--smtp-port ${mailcatcher::smtp_port}"
  }

  $command = "/usr/local/bin/mailcatcher --foreground ${http_addr} ${http_port} ${smtp_addr} ${smtp_port}"

  systemd::unit_file { 'mailcatcher.service':
    content => epp('mailcatcher/mailcatcher.service.epp', {
          'description'   => $mailcatcher::service_desc,
          'documentation' => $mailcatcher::service_doc,
          'after'         => $mailcatcher::service_after,
          'type'          => $mailcatcher::service_type,
          'execstart'     => $command,
          'restart'       => $mailcatcher::service_restart,
          'wantedby'      => $mailcatcher::service_wanted,
          'restart_time'  => $mailcatcher::service_restart_time,
        }),
    enable  => true,
    active  => true,
  }
}


