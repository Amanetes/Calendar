# frozen_string_literal: true

require 'date'

START_OF_CALENDAR = 1
DATE_BOX_SIZE = 4

def cal(year, month)
  raise 'Wrong year' unless year.is_a?(Integer)

  months = {
    'Jan' => 1,
    'Feb' => 2,
    'Mar' => 3,
    'Apr' => 4,
    'May' => 5,
    'Jun' => 6,
    'Jul' => 7,
    'Aug' => 8,
    'Sep' => 9,
    'Oct' => 10,
    'Nov' => 11,
    'Dec' => 12
  }
  date = Date.new(year, months[month], START_OF_CALENDAR)
  current_month = months[month]

  weekdays = Date::ABBR_DAYNAMES.map(&:to_s)

  year_month_header = "#{date.strftime('%b')} #{date.year}"

  puts year_month_header
  puts weekdays.join(' ')

  current_weekday = date.wday

  box_indent = ''.center(current_weekday * DATE_BOX_SIZE, ' ')

  while date.month == current_month do

    while current_weekday < weekdays.length && date.month == current_month do

      day = "#{box_indent}#{date.day.to_s.center(DATE_BOX_SIZE, ' ')}"

      box_indent = '' # Reset indent
      print day

      date += 1
      current_weekday += 1
    end

    current_weekday = 0
    print "\n"
  end
end

