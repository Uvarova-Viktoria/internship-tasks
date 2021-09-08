# открыли файл с текстом
# ключ длинной 3
# => разбиваем текст на группы символов (кол-во групп = длине ключа = 3)
# в каждой группе находятся символы кодируемые i- м символом ключа
# т.е 1я группа 1м символом и тд
# 
# находим наиболее часто входящий элемент => пробел
# найденный эл  xor 32 (пробел в ascii) = получаем число ключа
# составляем ключ
# дешифруем текст

f = File.new("59.txt")
content = f.read
content = content.split(',').map(&:to_i)
first_letter = []
second_letter = []
third_letter = []

(0...content.size).step(3) do |n|
	first_letter<<content[n]
	second_letter<<content[n+1]
	third_letter<<content[n+2]	
end

#находим наиболее часто входящий элемент в каждой группе (1_2_3.index)
first_mass = first_letter.uniq.map { |x| first_letter.count(x) }
first_index = first_letter.uniq[first_mass.index(first_mass.max)]

second_mass = second_letter.uniq.map { |x| second_letter.count(x) }
second_index = second_letter.uniq[second_mass.index(second_mass.max)]

third_mass = third_letter.uniq.map { |x| third_letter.count(x) }
third_index = third_letter.uniq[third_mass.index(third_mass.max)]

# совмещаем полученные значения и находим ключ, xor  с пробелом (32)
key = []
key << (first_index^32)
key << (second_index^32)
key << (third_index^32)
#key = [101,120,112]
# e,x,p

#дешифруем текст
(0...content.size).step(3) do |n|
	content[n]=(content[n]^key[0]).chr
	content[n+1]=(content[n+1]^key[1]).chr
	content[n+2]=(content[n+2]^key[2]).chr	
end

print content.join('')
