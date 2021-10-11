# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include dkm_mailcatcher::systemdunit
class dkm_mailcatcher::systemdunit {
  file { $idkm_mailcatcher::target_path:
    ensure  => present,
    content => epp('dkm_mailcatcher/mailcatcher.service.epp', {
      'description'   => $dkm_mailcatcher::service_desc,
      'documentation' => $dkm_mailcatcher::service_doc,
      'after'         => $dkm_mailcatcher::service_start,
      'type'          => $dkm_mailcatcher::service_type,
      'execstart'     => $dkm_mailcatcher::service_cmd,
      'restart'       => $dkm_mailcatcher::service_restart,
      'wantedby'      => $dkm_mailcatcher::service_wanted,
    }),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
