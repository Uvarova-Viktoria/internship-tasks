content = File.open("79.txt").map {|line| line.chomp}

card_uniq = {}

check_uniq_number = content.join.chars.uniq
#create uniq hash from number of our txt
check_uniq_number.each do |temp|
	card_uniq[temp] = "0"
end

content.each do |number|
	if card_uniq.include?(number[1])
		card_uniq[number[1]] << number[0]
	elsif card_uniq.include?(number[2])
		card_uniq[number[2]] << number[1]	
	end
end

puts card_uniq
card_uniq.each do |el|
	print el[1].split('').uniq
end

#{"3"=>"077", "1"=>"0337773773733337", "9"=>"06278", "6"=>"07731171137", "8"=>"0616663263", "0"=>"0", "2"=>"01676777777", "7"=>"0"}
#["0", "7"]["0", "3", "7"]["0", "6", "2", "7", "8"]["0", "7", "3", "1"]["0", "6", "1", "3", "2"]["0"]["0", "1", "6", "7"]["0"]
