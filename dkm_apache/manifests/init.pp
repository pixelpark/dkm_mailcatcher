# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include dkm_apache
class dkm_apache (
  String  $package,
  String  $service,
  String  $state,
  String  $status,
) {
  
  include dkm_apache::install
  include dkm_apache::service

}
