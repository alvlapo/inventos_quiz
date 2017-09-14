#!/usr/bin/ruby

require 'prime'
require_relative 'naive_search_generator'

MAX_VALUE = 105
primes = [nil] 

Prime.each(nil, NaiveSearchGenerator.new) do |prime|
  primes << prime
  break if primes.size >= MAX_VALUE 
end

puts "Введите номер (от 0 до #{MAX_VALUE}) простого числа."
puts "Для завершения введите '0'"

loop do
  puts 'Введите номер:'
  num = gets.chomp
  next unless num =~ /[[:digit:]]/

  pos = num.to_i

  next if pos >= MAX_VALUE or pos < 0
  break if pos == 0

  puts "Простое число N#{num} : " << primes[pos].to_s
end
