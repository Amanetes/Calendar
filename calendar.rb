# frozen_string_literal: true

require 'date'

class Calendar
  def self.call
    new.call
  end

  def initialize(date = Date.today)
    @today = date
  end

  def call
    build_calendar
  end

  private

  attr_reader :today

  def first_day_of_month
    Date.new(today.year, today.month, 1)
  end

  def days_in_month
    Date.new(today.year, today.month, -1).day
  end

  def calendar_header
    puts today.strftime('%B %Y').to_s
    weekdays = Date::ABBR_DAYNAMES.map(&:to_s)
    puts weekdays.join(' ')
  end

  def indents
    first_day_of_month.wday.times do
      print '    '
    end
  end

  def print_dates
    (1..days_in_month).each do |day|
      print "#{day.to_s.rjust(2)}  "
      # перенос строки должен произойти не только по достижении конца недели, но и по достижении последнего дня месяца
      print "\n" if ((first_day_of_month.wday + day) % 7).zero? || day == days_in_month
    end
    print "\n"
  end

  def build_calendar
    calendar_header
    indents
    print_dates
  end
end
