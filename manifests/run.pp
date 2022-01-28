# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mailcatcher::run
class mailcatcher::run {
  if $mailcatcher::http_addr {
    $http_addr = "--http-ip ${mailcatcher::http_addr}"
  }
  if $mailcatcher::http_port {
    $http_port = "--http-port ${mailcatcher::http_port}"
  }
  if $mailcatcher::smtp_addr {
    $smtp_addr = "--smtp-addr ${mailcatcher::smtp_addr}"
  }
  if $mailcatcher::smtp_port {
    $smtp_port = "--smtp-port ${mailcatcher::smtp_port}"
  }

  $command = "mailcatcher ${http_addr} ${http_port} ${smtp_addr} ${smtp_port}"

  $old_path  = $facts['path']
  $new_path  = "${old_path}:/usr/local/bin"
  exec { 'mailcatcher':
    path     => $new_path,
    command  => $command,
    provider => $mailcatcher::terminal_provider,
    unless   => 'ss -tlpn | grep 1080',
  }
}
