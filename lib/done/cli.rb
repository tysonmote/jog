require 'thor'
require 'pp'

module Done
  class CLI < Thor
    desc "today", "Edit the log entry for today"
    def today
      Done.edit( Done.get_or_create_file( Time.now ) )
    end

    desc "config", "Print the current configuration"
    def config
      puts "Config"
      puts "------"
      pp Done.config
      puts
      puts "Template"
      puts "--------"
      puts Done.template
    end
  end
end
