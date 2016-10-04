# frozen_string_literal: true
require 'prime' # Ruby Prime

module PrimeMultiplier
  # class that generates the first `count` prime numbers
  class Prime
    class << self
      def generate(count)
        return [] if count < 1
        # this is used to obtain the last prime number so we can set it as
        # the max ceiling value when calculating the primes until that number
        # If this can't be used we could set an arbitrary high value to run
        # or add a breakpoint if we have enough values
        prime = ::Prime.first(count).last

        @primes = primes_until(prime)
        @primes.take(count)
      end

      # The algorithm used to calculate the prime numbers is
      # based on the pseudocode present on the wikipedia page
      # https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes#Algorithm_and_variants
      def primes_until(number)
        numbers = (0..number).to_a

        # both 0 and 1 are not prime numbers
        numbers[0] = numbers[1] = nil

        max_val = Math.sqrt(number)
        (2..max_val).each do |i|
          next if numbers[i].nil?

          (i**2..number).step(i).each do |j|
            numbers[j] = nil
          end
        end

        numbers.compact
      end
    end
  end
end
