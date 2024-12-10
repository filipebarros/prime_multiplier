# frozen_string_literal: true

require 'spec_helper'
require 'prime_multiplier/prime'

describe PrimeMultiplier::Prime do
  it 'returns empty array when count is below 1' do
    expect(described_class.generate(0)).to be_empty
  end

  it 'returns array with `1` number' do
    expect(described_class.generate(1).count).to eq(1)
  end

  it 'returns array with `10` numbers' do
    expect(described_class.generate(10).count).to eq(10)
  end

  it 'returns array with the first `1` prime number' do
    first_prime = Prime.first(1)
    expect(described_class.generate(1)).to eq(first_prime)
  end

  it 'returns array with the first `10` prime numbers' do
    first_ten_primes = Prime.first(10)
    expect(described_class.generate(10)).to eq(first_ten_primes)
  end
end
