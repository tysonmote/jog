require 'thor'

module Done
  class CLI < Thor
    desc "today", "Edit the log entry for today"
    def today
      Done.edit( Done.get_or_create_file( Time.now ) )
    end

    desc "config", "Print out the loaded configuration"
    long_desc <<-TXT
      TODO
    TXT
    def config
      p Done.config
    end
  end
end
