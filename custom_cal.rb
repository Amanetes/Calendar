#!/usr/bin/env ruby
# frozen_string_literal: true

require 'date'

month = ARGV[0].to_i
year = ARGV[1].to_i

DAYNAMES = Date::ABBR_DAYNAMES.map { _1[0..1] }.rotate(1).freeze

month_name = Date::MONTHNAMES[month]
first_day = Date.new(year, month, 1)
last_day = Date.new(year, month, -1)

puts "#{month_name} #{year}".center(20)
puts DAYNAMES.join(' ')

# Корректируем значение для понедельника как 0, т.к. это будет началом недели
# first_day_wday = (first_day.wday - 1) % 7
first_day_wday = (first_day.wday == 0) ? 6 : first_day.wday - 1

# Печатаем пробелы до первого дня месяца
print '   ' * first_day_wday

(1..last_day.day).each do |day|
  print "#{day.to_s.rjust(2)} "
  puts if ((first_day_wday + day) % 7).zero? || day == last_day
end

puts
