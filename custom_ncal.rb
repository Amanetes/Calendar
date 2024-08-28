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

# Создаем массив-неделю для хранения дней месяца
# 7 дней, 6 - недель, пустые значения наполняем пробелами
week = Array.new(7) { Array.new(6, '  ') }

# Вычисляем смещение для первого дня месяца (0 - понедельник, 6 - воскресенье)
# offset — это смещение, которое указывает, на сколько дней в неделю нужно сдвинуть начало месяца
offset = (first_day.wday == 0) ? 6 : first_day.wday - 1

(1..last_day.day).each_with_object(week) do |day, memo|
  index = offset + day - 1
  column = index % 7
  row = index / 7
  memo[column][row] = day.to_s.rjust(2)
end

# Выводим дни недели и календарь
# Week заполнено на прошлом шаге, поэтому просто берем по индексу
DAYNAMES.each_with_index do |day, index|
  puts "#{day} #{week[index].join(' ')}"
end
