require 'thor'
require 'pp'
require 'colored'

module Jog
  class CLI < Thor
    desc "today", "Edit the log entry for today"
    def today
      Jog.edit( Jog.get_or_create_file( Time.now ) )
    end

    desc "config", "Print the current configuration"
    def config
      puts "Config".green.underline
      pp Jog.config
      puts
      puts "Template".green.underline
      puts Jog.template
    end
  end
end
