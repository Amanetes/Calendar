#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../calendar'
puts 'Enter year: '
input_year = gets.chomp!
puts "Enter month's short name: "
input_month = gets.chomp!

# Enter numeric type year and month's short name as a string
cal(input_year.to_i, input_month)
