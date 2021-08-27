#task Roman numerals
=begin
	I = 1
	V = 5
	X = 10
	L = 50
	C = 100
	D = 500
	M = 1000
=end

f = File.new("89.txt")
content = f.readlines
num = {
	"IIII" => "IV",
	"IIIII" => "V",
	"DCCCC" => "CM",
	"CCCC" => "CD",
	"LXXXX" => "XC",
	"XXXX" => "XL"
}