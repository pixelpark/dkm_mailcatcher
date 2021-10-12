# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include dkm_hostname
class dkm_hostname {
  $server_name = 'test2-d-001'

  $environment_name = dkm_hostname::environment($server_name)

  notify { "My environment is ${environment_name}": }
}
