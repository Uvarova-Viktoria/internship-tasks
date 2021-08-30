#task poker hands
f = File.new("54.txt")
content = f.readlines
cards_suits = {
	'A' => 14,
	'K' => 13,
	'Q' => 12,
	'J' => 11,
	'T' => 10,
	'9' => 9,
	'8' => 8,
	'7' => 7,
	'6' => 6,
	'5' => 5,
	'4' => 4,
	'3' => 3,
	'2' => 2
}

def high_card line, cards_suits
	res = []
	(0...line.length).step(3) do |n|
		res.push(cards_suits["#{line[n]}"])
	end
	return res.max
end

def one_pair line
	(0...line.length).step(3) do |n|
		if line.count("#{line[n]}") > 1 
			return true
		end
	end
	return false	
end

def two_pairs line
	count=0;
	(0...line.length).step(3) do |n|
		if line.count("#{line[n]}") > 1 
			count+=1
		end
	end
	if count==2 
		return true
	else
		return false	
	end
end

def three_of_kind line
	count=0;
	(0...line.length).step(3) do |n|
		if line.count("#{line[n]}") > 1 
			count+=1
		end
	end
	if count == 3
		return true
	else 
		return false
	end
end

def straight line, cards_suits
	res = []
	(0...line.length).step(3) do |n|
		res.push(cards_suits["#{line[n]}"])
	end
	if(res.uniq.length ==5 && (res[4] - res[0] == 4))
		return true
	else 
		return false
	end
end

def flush line
	res = []
	(1...line.length).step(3) do |n|
		res.push(line[n])	
	end
	if res.uniq.length == 1
		return true
	else return false
	end
end

def full_house line, cards_suits
	res = []
	(0...line.length).step(3) do |n|
		res.push(cards_suits["#{line[n]}"])
	end
	if res.uniq.count == 2
		return true
	else
		return false
	end
end

def four_of_a_kind line, cards_suits
	res = []
	(1...line.length).step(3) do |n|
		res.push(line[n])	
	end
	resNumber = []
	(0...line.length).step(3) do |n|
		resNumber.push(cards_suits["#{line[n]}"])
	end
	if resNumber.uniq.length == 2 
		return true
	else return false
	end
end

def straight_flush line, cards_suits
	res = []
	(1...line.length).step(3) do |n|
		res.push(line[n])	
	end
	if res.uniq.length == 1 && straight(line,cards_suits)
		return true
	else return false
	end	
end

def royal_flush line, cards_suits
	res = []
	(0...line.length).step(3) do |n|
		res.push(cards_suits["#{line[n]}"])	
	end
	res = res.sort
	return false
	#if ((res[0]>=10) && straight(line, cards_suits))
	#	return true
	#else return false
	#end
end

count_First_player = 0;
count_Sec_player = 0;

for i in 0...1000
	first_player_line = content[i][0,15]
	second_player_line = content[i][-15,15]
	
	mass_resault_first = [royal_flush(first_player_line, cards_suits), straight_flush(first_player_line, cards_suits),four_of_a_kind(first_player_line, cards_suits),full_house(first_player_line, cards_suits), flush(first_player_line), straight(first_player_line, cards_suits), three_of_kind(first_player_line),two_pairs(first_player_line),one_pair(first_player_line)]

	mass_resault_second = [royal_flush(second_player_line, cards_suits), straight_flush(second_player_line, cards_suits),four_of_a_kind(second_player_line, cards_suits),full_house(second_player_line, cards_suits), flush(second_player_line), straight(second_player_line, cards_suits), three_of_kind(second_player_line),two_pairs(second_player_line),one_pair(second_player_line)]

	
	min_index_first = mass_resault_first.index(true) == nil ? 10 : mass_resault_first.index(true)
	min_index_second = mass_resault_second.index(true) == nil ? 10 : mass_resault_second.index(true)
	
	puts min_index_first
	puts min_index_second
	
	if (min_index_first < min_index_second)
		count_First_player +=1
	else
		count_Sec_player +=1
	end
end

puts count_First_player
puts count_Sec_player
