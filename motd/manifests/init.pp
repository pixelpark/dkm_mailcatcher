# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include motd
class motd {
  $params = {
    "os_name"     => $::facts['os']['family'],
    "os_major"    => $::facts['os']['release']['major'],
    "os_minor"    => $::facts['os']['release']['minor'],
    "server_name" => $::trusted['certname']
  }
  
  file { '/etc/motd':
    ensure => file,
    #source => 'puppet:///modules/motd/motd.txt',
    content => epp('motd/motd.epp', $params),
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
}
