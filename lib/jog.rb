require 'jog/version'
require 'jog/config'
require 'fileutils'
require 'erb'

module Jog
  include Config

  class << self
    def get_or_create_file( time )
      subpath = time.strftime( Jog.config[:path_format] )
      full_path = File.expand_path( File.join( Jog.config[:root], subpath ) )

      unless File.exists?( full_path )
        FileUtils.mkdir_p( File.dirname( full_path ) )
        if Jog.template
          File.open( full_path, 'w' ) do |file|
            text = ERB.new( Jog.template ).result
            file.write( text )
          end
        else
          FileUtils.touch( full_path )
        end
      end

      full_path
    end

    def edit( path )
      system "#{Jog.config[:editor]} #{path}"
    end
  end
end
