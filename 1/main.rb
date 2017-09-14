#!/usr/bin/ruby

require_relative 'ext_range'

RANGE = ExtRange.new(-214, 214)

puts 'Cумма последовательности A, A+1, A+2, …, B-2, B-1, B.'
puts "Введите два целых числа A и B, при условии \
 #{RANGE.first-1} < A < B < #{RANGE.last+1}"

loop do
  puts 'Введите число А: '
  a = gets.chomp

  puts 'Введите число B: '
  b = gets.chomp

  unless a =~ /[[:digit:]]/ and b =~ /[[:digit:]]/
    puts 'Неверный ввод. Введите числа.'
    next
  end

  seq = ExtRange.new(a.to_i, b.to_i)

  if seq.empty? 
    puts 'Неверный ввод. Число А должно быть меньше числа B.'
    next
  end

  if RANGE.cover?(seq)
    puts 'Сумма ряда: ' << seq.series_sum.to_s
    break
  else 
    puts 'Неверный ввод. Введите значения в пределах диапазона!'
    next
  end
end
