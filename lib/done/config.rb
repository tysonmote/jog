require 'active_support/concern'
require 'ostruct'

module Done
  module Config
    extend ActiveSupport::Concern
    class InvalidConfig < StandardError; end

    module ClassMethods
      CONFIG_NAME = ".donerc"
      CONFIG_VARS = %w{root editor path_format}

      def config
        @config ||= OpenStruct.new(load_config)
      end

      protected

      def load_config
        config = {
          'root' => '~/done',
          'editor' => 'vim -f',
          'path_format' => '%Y/%B/%d.txt'
        }
        config_paths.each do |path|
          next unless File.exists?(path)
          File.readlines(path).each do |line|
            match = /([a-z_]+): (.+)/.match(line)
            next unless match
            unless CONFIG_VARS.include?(match[1])
              raise InvalidConfig.new("\"#{match[1]}\" is not a valid configuration variable (from #{path})")
            end
            config[match[1]] = match[2]
          end
        end
        config['root'] = File.expand_path(config['root'])
        config
      end

      def config_paths
        dir = Dir.pwd
        paths = []
        while dir != File::SEPARATOR do
          paths << File.join(dir, CONFIG_NAME)
          dir = File.split(dir).first
        end
        ["/", "~/"].each do |root|
          paths << File.expand_path("#{root}#{CONFIG_NAME}")
        end
        paths
      end
    end
  end
end
