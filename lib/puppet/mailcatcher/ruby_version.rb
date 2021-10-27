require 'puppet_x/mailcatcher/os_ruby_version'

Puppet::Functions.create_function(:'mailcatcher::ruby_version') do
  dispatch :ruby_version do
    return_type 'Optional[String]'
  end

  def ruby_version()
    Puppet::Mailcatcher.ruby_version()
  end

end
