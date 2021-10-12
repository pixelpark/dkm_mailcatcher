# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include mailcatcher::systemdunit
class mailcatcher::systemdunit {
  file { $mailcatcher::target_path:
    ensure  => present,
    content => epp('mailcatcher/mailcatcher.service.epp', {
      'description'   => $mailcatcher::service_desc,
      'documentation' => $mailcatcher::service_doc,
      'after'         => $mailcatcher::service_start,
      'type'          => $mailcatcher::service_type,
      'execstart'     => $mailcatcher::service_cmd,
      'restart'       => $mailcatcher::service_restart,
      'wantedby'      => $mailcatcher::service_wanted,
    }),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
