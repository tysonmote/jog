require 'active_support/concern'

module Jog
  module Config
    extend ActiveSupport::Concern
    class InvalidConfig < StandardError; end

    module ClassMethods
      CONFIG_NAME = ".jogrc"
      TEMPLATE_NAME = ".jogtemplate"
      CONFIG_VARS = %w{root editor path_format}
      DEFAULT_CONFIG = {
        root: '~/jog',
        editor: ENV['EDITOR'] || 'vim',
        path_format: '%Y/%B/%d.txt'
      }
      DEFAULT_TEMPLATE = nil

      def config
        @config ||= load_config
      end

      def template
        @template ||= load_template
      end

      protected

      def load_config
        config = DEFAULT_CONFIG.dup
        if path = config_path
          File.readlines( path ).each do |line|
            next unless match = /([a-z_]+): (.+)/.match( line )
            key, value = [match[1], match[2]]
            unless CONFIG_VARS.include?( key )
              raise InvalidConfig.new( "\"#{key}\" is not a valid configuration variable (from #{path})" )
            end
            config[key.to_sym] = value
          end
        end
        config[:root] = File.expand_path( config[:root] )
        config
      end

      def load_template
        if path = template_path
          File.read( path )
        else
          DEFAULT_TEMPLATE.dup
        end
      end

      def config_path
        allowed_paths( CONFIG_NAME ).find do |path|
          File.exists?( path )
        end
      end

      def template_path
        allowed_paths( TEMPLATE_NAME ).find do |path|
          File.exists?( path )
        end
      end

      # Returns an array of allowed paths for the given folder / file name, in
      # the order they should be searched.
      def allowed_paths( basename )
        dir = Dir.pwd
        paths = []
        while dir != File::SEPARATOR do
          paths << File.join( dir, basename )
          dir = File.split( dir ).first
        end
        ["/", "~/"].each do |root|
          paths << File.expand_path( "#{root}#{CONFIG_NAME}" )
        end
        paths
      end
    end
  end
end
