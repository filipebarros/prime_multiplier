# frozen_string_literal: true
require 'spec_helper'
require 'prime_multiplier/table'

describe PrimeMultiplier::Table do
  let(:prime_array) { PrimeMultiplier::Prime.generate(4) }

  it 'generates the table header' do
    expected_output = ['', 2, 3, 5, 7]

    expect(described_class.generate_header(prime_array)).to eq(expected_output)
  end

  it 'generates all rows' do
    expected_output = [
      [2, 4, 6, 10, 14],
      [3, 6, 9, 15, 21],
      [5, 10, 15, 25, 35],
      [7, 14, 21, 35, 49]
    ]

    expect(described_class.generate_rows(prime_array)).to eq(expected_output)
  end

  it 'combines the result of header and rows to generate the whole table' do
    expected_output = [
      '+---+----+----+----+----+',
      '|   | 2  | 3  | 5  | 7  |',
      '+---+----+----+----+----+',
      '| 2 | 4  | 6  | 10 | 14 |',
      '| 3 | 6  | 9  | 15 | 21 |',
      '| 5 | 10 | 15 | 25 | 35 |',
      '| 7 | 14 | 21 | 35 | 49 |',
      '+---+----+----+----+----+'
    ].join("\n")

    expect(described_class.print(prime_array)).to eq(expected_output)
  end
end
