# @summary Class to manages the systemdunit file
#
# @param desc
# @param doc
# @param after
# @param type
# @param restart
# @param wanted
# @param restart_time
class mailcatcher::systemdunit (
  String $desc,
  String $doc,
  String $after,
  String $type,
  String $restart,
  String $restart_time,
  String $wanted,
) {
  assert_private()

  $_http_addr = $mailcatcher::http_addr ? {
    undef   => '',
    default => "--http-ip ${mailcatcher::http_addr}",
  }
  $_http_port = $mailcatcher::http_port ? {
    undef   => '',
    default => "--http-port ${mailcatcher::http_port}",
  }
  $_smtp_addr = $mailcatcher::smtp_addr ? {
    undef   => '',
    default => "--smtp-ip ${mailcatcher::smtp_addr}",
  }
  $_smtp_port = $mailcatcher::smtp_port ? {
    undef   => '',
    default => "--smtp-port ${mailcatcher::smtp_port}",
  }

  $_parameter = ['--foreground', $_http_addr, $_http_port, $_smtp_addr, $_smtp_port].join(' ')

  systemd::manage_unit { 'mailcatcher.service':
    ensure        => present,
    enable        => true,
    active        => true,
    unit_entry    => {
      'Description'   => $desc,
      'Documentation' => $doc,
      'After'         => $after,
    },
    service_entry => {
      'Type'       => $type,
      'ExecStart'  => "/usr/local/bin/mailcatcher ${_parameter}",
      'Restart'    => $restart,
      'RestartSec' => $restart_time,
      'User'       => $mailcatcher::user,
      'Group'      => $mailcatcher::group,
    },
    install_entry => {
      'WantedBy' => $wanted,
    },
  }
}
