# frozen_string_literal: true

require 'spec_helper'
require 'prime_multiplier/table'

describe PrimeMultiplier::Table do
  let(:prime_array) { PrimeMultiplier::Prime.generate(4) }

  let(:header) { ['', 2, 3, 5, 7] }

  let(:rows) do
    [
      [2, 4, 6, 10, 14],
      [3, 6, 9, 15, 21],
      [5, 10, 15, 25, 35],
      [7, 14, 21, 35, 49]
    ]
  end

  let(:full_table) do
    [
      '+---+----+----+----+----+',
      '|   | 2  | 3  | 5  | 7  |',
      '+---+----+----+----+----+',
      '| 2 | 4  | 6  | 10 | 14 |',
      '| 3 | 6  | 9  | 15 | 21 |',
      '| 5 | 10 | 15 | 25 | 35 |',
      '| 7 | 14 | 21 | 35 | 49 |',
      '+---+----+----+----+----+'
    ].join("\n")
  end

  it 'generates the table header' do
    expect(described_class.generate_header(prime_array)).to eq(header)
  end

  it 'generates all rows' do
    expect(described_class.generate_rows(prime_array)).to eq(rows)
  end

  it 'combines the result of header and rows to generate the whole table' do
    expect(described_class.generate(prime_array)).to eq(full_table)
  end
end
