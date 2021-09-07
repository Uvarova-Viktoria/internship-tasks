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
	end
	if card_uniq.include?(number[2])
		card_uniq[number[2]] << number[1]	
		card_uniq[number[2]] << number[0]
	end
end

print card_uniq.sort_by{|key, value|value.chars.uniq.size}.map{|el| el[0]}.join()
#answer = 731 628 90
