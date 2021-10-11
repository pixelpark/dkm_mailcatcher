# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include dkm_mailcatcher::run
class dkm_mailcatcher::run {
  exec { 'mailcacther':
    command  => $dkm_mailcatcher::command,
    provider => $dkm_mailcatcher::terminal_provider,
    unless   => 'ss -tlpn | grep 1080',
  }
}
