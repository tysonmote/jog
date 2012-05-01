require 'done/version'
require 'done/config'
require 'fileutils'
require 'erb'

module Done
  include Config

  class << self
    def get_or_create_file( time )
      subpath = time.strftime( Done.config[:path_format] )
      full_path = File.expand_path( File.join( Done.config[:root], subpath ) )
      path, _ = File.split( full_path )

      unless File.exists?( full_path )
        FileUtils.mkdir_p( path )
        if Done.template
          File.open( full_path, 'w' ) do |file|
            text = ERB.new( Done.template ).result
            file.write( text )
          end
        else
          FileUtils.touch( path )
        end
      end
      full_path
    end

    def edit( path )
      system "#{Done.config[:editor]} #{path}"
    end
  end
end
