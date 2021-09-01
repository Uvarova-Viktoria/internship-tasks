#task Passcode derivation

f = File.new("79.txt")
content = f.readlines

arr0 = []
arr1 = []
arr2 = []
arr3 = []
arr4 = []
arr5 = []
arr6 = []
arr7 = []
arr8 = []
arr9 = []

for i in 0...content.size
	case content[i][1].to_i
	when 0
		arr0.push(content[i][0])
	when 1
		arr1.push(content[i][0])
	when 2
		arr2.push(content[i][0])
	when 3
		arr3.push(content[i][0])
	when 4
		arr0.push(content[i][0])
	when 5
		arr5.push(content[i][0])
	when 6
		arr6.push(content[i][0])
	when 7
		arr7.push(content[i][0])
	when 8
		arr8.push(content[i][0])
	else
		arr9.push(content[i][0])
	end
	
	case content[i][2].to_i
	when 0
		arr0.push(content[i][1])
	when 1
		arr1.push(content[i][1])
	when 2
		arr2.push(content[i][1])
	when 3
		arr3.push(content[i][1])
	when 4
		arr0.push(content[i][1])
	when 5
		arr5.push(content[i][1])
	when 6
		arr6.push(content[i][1])
	when 7
		arr7.push(content[i][1])
	when 8
		arr8.push(content[i][1])
	else
		arr9.push(content[i][1])
	end
end

resault = [arr0.uniq.size,arr1.uniq.size,arr2.uniq.size,arr3.uniq.size,arr4.uniq.size,arr5.uniq.size,arr6.uniq.size,arr7.uniq.size,arr8.uniq.size,arr9.uniq.size]
print resault