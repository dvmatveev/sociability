require_relative 'lib/resultcalculator.rb'
require_relative 'lib/questionlist.rb'

# encoding: utf-8
#
# Тест на уровень коммуникабельности. Вторая версия.
#
# На основе психологического теста на сайте Синтона
#
# http://www.syntone-spb.ru/library/article_syntone/content/4969.html

version = "Ваш уровень общительности. Тест поможет определить ваш уровень " \
  "коммуникабельности. Версия 0.3. (c)\n\n"

# Выводим информацию о программе
puts version

# Файл с текстом вопросов
questions_file_name = "#{File.dirname(__FILE__)}/data/questions.txt"

# класс вопросов
question_list = QuestionList.new

# читаем вопросы из файла, на каждой строке один вопрос, метод возвращает массив вопросов
questions = question_list.read_from_file(questions_file_name)

# класс обработки ответов
result_calculator = ResultCalculator.new

# проходим по массиву вопросов, выводя каждый
questions.each  do |question|
  puts question.chomp

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
   # Заносим баллы за ответ в объект result_calculator, в нём хранятся ответы, вычисляемые согласно заработанным баллам
  case
    when user_input == 1
      result_calculator.points += 2
     when user_input == 3
      result_calculator.points += 1
  end
end

puts "\n\nВ результате прохождения теста вы набрали всего баллов - #{result_calculator.points}\n"
puts "Ваш уровень общительности:\n\n"
# Выводим содержание результата прохождения теста
puts result_calculator.get_result_text
