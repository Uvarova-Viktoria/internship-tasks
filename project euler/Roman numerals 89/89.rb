#task Roman numerals

#	I = 1
#	V = 5
#	X = 10
#	L = 50
#	C = 100
#	D = 500
#	M = 1000

content = File.open("89.txt").map {|line| line.chomp}
num = {
	"IIII" => "IV",
	"IIIII" => "V",
	"DCCCC" => "CM",
	"CCCC" => "CD",
	"LXXXX" => "XC",
	"XXXX" => "XL"
}
puts "start length = #{content.length}"
start_length = content.length

content.each do |line|
	line.gsub! 'IIII', 'IV'
	line.gsub! 'IIIII', 'V'
	line.gsub! 'DCCCC', 'CM'
	line.gsub! 'CCCC', 'CD'
	line.gsub! 'LXXXX', 'XC'
	line.gsub! 'XXXX', 'XL'
end

puts "finish length = #{content.length}"
finish_length = content.length

resualt = start_length - finish_length
puts "resualt = #{resualt}"
