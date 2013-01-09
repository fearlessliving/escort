require 'readline'

module Escort
  class Arguments
    class << self
      def read(arguments, no_arguments_valid=false)
        if arguments.empty? && !no_arguments_valid
          while command = Readline.readline("> ", true)
            arguments << command
          end
          arguments = arguments.compact.keep_if{|value| value.length > 0}
          if arguments.empty?
            STDERR.puts "You must provide some arguments to this script"
            exit(Escort::USER_ERROR_EXIT_CODE)
          end
        end
        arguments
      end
    end
  end
end
