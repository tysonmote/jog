require 'thor'
require 'pp'
require 'colored'
require 'active_support/time'

module Jog
  class CLI < Thor
    desc "today", "Edit the log entry for today"
    def today
      Jog.edit( Jog.get_or_create_file( Time.now ) )
    end

    desc "yesterday", "Edit the log entry for yesterday"
    def yesterday
      Jog.edit( Jog.get_or_create_file( Time.now - 1.day ) )
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
