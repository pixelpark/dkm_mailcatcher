
require 'puppet_x/infra/pp_which'

require 'puppet_x/mailcatcher/os_ruby_version'

Facter.add(:mc_os_ruby_path) do
  confine kernel: 'Linux'

  setcode do
    Puppet::Infra.which('ruby')
  end
end

Facter.add(:mc_os_ruby_version) do
  confine kernel: 'Linux'

  setcode do
    Puppet::Mailcatcher.ruby_version()
  end
end
