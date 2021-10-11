# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include dkm_mailcatcher::install
class dkm_mailcatcher::install {
  package { 'mailcatcher':
    ensure   => $dkm_mailcatcher::ensure,
    provider => $dkm_mailcatcher::package_provider,
  }
}
