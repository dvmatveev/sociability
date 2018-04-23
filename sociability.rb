require_relative 'lib/result.rb'
require_relative 'lib/queschion.rb'

# encoding: utf-8
#
# Тест на уровень коммуникабельности. Вторая версия.
#
# На основе психологического теста на сайте Синтона
#
# http://www.syntone-spb.ru/library/article_syntone/content/4969.html

version = "Ваш уровень общительности. Тест поможет определить ваш уровень " \
  "коммуникабельности. Версия 0.2. (c)\n\n"

# Выводим информацию о программе
puts version

# класс вопросов
queschion = Queschion.new()

# класс результата
result = Result.new()
# проходим по массиву вопросов до тех пор, пока номер текущего вопроса
# не станет равен размеру массива вопросов, тогда заканчиваем обход
until queschion.size == queschion.current + 1
  puts
  puts queschion.text # Выводим текущий вопрос
  # Цикл, повторяющий просьбу ввести ответ до тех пор, пока не будет введен
  # один из предлагаемых вариантов
  user_input = 0
  until user_input == 1 || user_input == 2 || user_input == 3
    puts "Введите число и нажмите Enter:"
    puts "1 — да"
    puts "2 — нет"
    puts "3 — иногда"

    # Записываем ответ пользователя из консоли, переведя его в число
    user_input = gets.to_i
  end
    # Заносим баллы за ответ в объект result, в нём хранятся ответы, вычисляемые согласно заработанным баллам
  case
    when user_input == 1
      result.points += 2
     when user_input == 3
      result.points += 1
  end

end

puts "\n\nРезультат теста (всего баллов - #{result.points})"
puts
# Выводим содержание результата прохождения теста
puts result.text
