# Custom ruby script to detect version of ruby from OS package

require 'puppet_x/infra/pp_which'

module Puppet::Mailcatcher
  #----------------------------------
  def self.ruby_version()
    ruby_bin = Puppet::Infra.which('ruby')

    if ruby_bin.nil?
      return nil
    end

    ruby_version_output = `ruby --version`

    version_pattern = %r{^ruby\s+(\S+)}i
    version_pattern.match(ruby_version_output)[1]
  end
end
