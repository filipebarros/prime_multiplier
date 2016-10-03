# frozen_string_literal: true
require 'terminal-table'

module PrimeMultiplier
  # class that prints the multiplication table
  class Table
    class << self
      def generate(array)
        header = generate_header(array)
        rows = generate_rows(array)

        table = Terminal::Table.new(headings: header, rows: rows)

        table.to_s
      end

      # this is just to generate the header of the table
      # this contains the array passed with an empty space in the
      # beginning of the array, for alignment purposes
      def generate_header(array)
        header_array = array.dup
        header_array.unshift('')
      end

      # each row contains a prime number and its multiplication
      # with the respective column number
      def generate_rows(array)
        rows = []
        array.each do |line|
          row = [line]
          array.each do |column|
            row << line * column
          end
          rows << row
        end

        rows
      end
    end
  end
end
