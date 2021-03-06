require 'prime'

# Наиболее наивный подход к поиску простых чисел
# Проверка на простоту заключается в следующем: перебирая числа 
# из диапазона от 2 до N-1, будем делить на k с остатком. Если при каком-то 
# обнаружится нулевой остаток, значит,n делится на k нацело, и число n
# составное. Если же при делении обнаруживались только ненулевые остатки, 
# значит, число простое. 
#
# Некоторые оптимизации
# - Перебирая потенциальные делители перебор обрывается когда делитель будет
#   больше чем кв. корнь числа, если до этого момента делителей нет, то их
#   нет вообще
# - Наименьший делитель составного числа простое число, ищем среди простых
#   уже найденных по порядку


class NaiveSearchGenerator < Prime::PseudoPrimeGenerator

  def initialize
    @primes = []
    @next_to_check = 3
    super
  end

  def succ
    if @primes.empty?
      @primes << 2
      return 2
    end

    prime = nil
    while not prime 
      # Ищем делитель среди уже найденных простых чисел
      @primes.each do |p|
        break if @next_to_check % p == 0 #число составное
        # Наименьший делитель не превосходит корень этого числа
        # Если до этого момента делителей не найдено, то их нет вообще
        if p > @next_to_check ** 0.5
          prime = @next_to_check
          break
        end
      end

      @next_to_check += 2; # поиск только среди нечетных чисел
    end
    
    @primes << prime
    return prime
  end

  def rewind
    initialize
  end

  alias next succ
end
