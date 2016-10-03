# frozen_string_literal: true
require 'optparse'
require 'prime_multiplier/prime'
require 'prime_multiplier/table'
require 'prime_multiplier/version'

module PrimeMultiplier
  # Class responsible for parsing the options and calling
  # the appropriate methods to deal with prime number generation
  # and to print the actual multiplication table
  class CommandLineInterface
    COUNT_DESCRIPTION = 'Number of prime numbers to be shown (REQUIRED)'
    HELP_DESCRIPTION = 'This help menu'

    def initialize
      @options = {}
      @optparser = OptionParser.new do |option|
        option.on('-c', '--count COUNT', Integer, COUNT_DESCRIPTION) do |count|
          @options[:count] = count
        end

        option.on('-h', '--help', HELP_DESCRIPTION)
      end

      @optparser.parse!
    end

    def validate_cli_options
      return if valid_options?

      puts @optparser
      exit
    end

    def generate_primes
      PrimeMultiplier::Prime.generate(@options[:count])
    end

    def print(primes)
      table_string = PrimeMultiplier::Table.generate(primes)
      puts table_string
    end

    private

    # count has to be 1 or higher
    def valid_options?
      @options[:count]&.positive?
    end
  end
end
