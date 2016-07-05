# encoding: utf-8
require 'mysql2'
require 'find'
require 'tk'
require 'digest/md5'

$line1  = 'Выберите критерии поиска:'
$line2  = '1) Маска'
$line3  = '2) Глубина погружения'
$line4  = '3) File or Directory'
$line5  = '4) Размер файла'
$line6  = '5) Начать поиск'
$line7  = 'Задайте маску для поиска:'
$line8  = 'Задайте глубину поиска:'
$line9  = 'Искать на '
$line10 = ' в глубину'
$line11 = 'Указано не числовое значение'
$line12 = '-------------------------------------'
$line13 = 'Искать файлы или папки:'
$line14 = 'Задайте размер файла:'
$line15 = 'Нужен вариант 1-5'
$line16 = 'Нужен вариант 1-2'
$line17 = '1) Искать файлы'
$line18 = '2) Искать папки'
$line19 = 'Будет осуществляться только поиск файлов'
$line20 = 'Будет осуществляться только поиск папок'
$line21 = 'Поиск по части, содержащей: '
$line22 = 'Размер файлов в байтах:'
$line23 = 'MD5 файлов:'
$line24 = 'Не указана маска, поиск любого файла'
$line25 = 'Не указана глубина поиска, поиск в базовой директории, без подпапок'
$line26 = 'Не указан тип поиска, поиск файлов'
$line27 = 'Размер файла не учитывается'
$line28 = 'Старт поиска'


$t1 = false
$t2 = false
$t3 = false
$t4 = false

$loop = 100
while $loop > 0
  $loop -= 1
  puts $line1
  puts $line2
  puts $line3
  puts $line4
  puts $line5
  puts $line6
  x = gets.to_i
  if x == 1
    $t1 = true
    puts $line7
    fcat = Proc.new {
      word = gets.chomp
      $pattern = '*' + word  + '*'
    }
    fcat.call
    puts $line21 + $pattern
    puts $line12
  elsif x == 2
    $t2 = true
    puts $line8
    $searchdeep = gets.chomp
     if $searchdeep.to_i != 0
       puts $line9 + $searchdeep.to_s + $line10
     else
       puts $line11
     end
      puts $line12
  elsif x == 3
    $t3 = true
    puts $line13
    puts $line17
	puts $line18
    puts $line12
	searchvariant = gets.to_i
		if searchvariant  == 1
			$searchtype = 'file'
			puts $line19
		elsif searchvariant == 2
			$searchtype = 'folder'
			puts $line20
		else 
        puts $line16
		end
  elsif x == 4
    $t4 = true
    puts $line14
    puts $line12
  elsif x == 5
	break
  else
    puts $line15
  end
end
# Вторая часть с проверкой
  if $t1 == false
       puts $line24
       $pattern = '*'
  end
  if $t2 == false
       puts $line25
       $searchdeep = 1
  end
  if $t3 == false
    puts $line26
    $searchtype = 'file'
  end
  if $t4 == false
	   puts $line27
  end
puts $line28
load 'Search.rb'

STDIN.gets()