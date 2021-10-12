# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include ssh::config
class ssh::config {
  file { '/etc/ssh/sshd_config':
    ensure => file,
    owner  => $ssh::user,
    group  => $ssh::group,
    mode   => $ssh::mode,
   content => template('ssh/sshd_conf.erb'),
   notify  => Service[$ssh::service_name],
  }
}
