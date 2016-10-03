# frozen_string_literal: true
require 'prime' # Ruby Prime

module PrimeMultiplier
  # class that generates the first `count` prime numbers
  class Prime
    class << self
      def generate(count)
        return [] if count < 1
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
