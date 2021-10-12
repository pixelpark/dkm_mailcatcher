# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mailcatcher::run
class mailcatcher::run {
  $old_path  = $facts['path']
  $new_path  = "${old_path}:/usr/local/bin"
  exec { 'mailcatcher':
    path     => $new_path,
    command  => $mailcatcher::command,
    provider => $mailcatcher::terminal_provider,
    unless   => 'ss -tlpn | grep 1080',
  }
}
