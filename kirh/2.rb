STDOUT.sync = true # DO NOT REMOVE
# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# r: number of rows.
# c: number of columns.
# a: number of rounds between the time the alarm countdown is activated and the time the alarm goes off.
r, c, a = gets.split(" ").collect { |x| x.to_i }
STDERR.puts "#{r},#{c},#{a} "

control_point=false
# pass - только сторона в которую идем (в виде числа) [2,1,3,0,2,2]
#kirh_pass- координаты каждого шага кирха в координатах [kr,kc] [[5,6],[6,6]...]
kirh_pass = []
pass = []

def reverse_pass(pass)
    #index of side [left = 0, down = 1, right= 2, up=3]  value = (index + 2) % 4 to reverse our pass
    return pass.reverse.map{ |value| value = (value+2)%4}
end

def isVisited(kirh_pass, dot)
    if kirh_pass.include?(dot)
        return true
    end
end

# game loop
loop do
    # kr: row where Kirk is located.
    # kc: column where Kirk is located.
    kr, kc = gets.split(" ").collect { |x| x.to_i }
    STDERR.puts "#{kr},#{kc}"
    #input of field, rows - our field
    rows = []
    r.times do
        row = gets.chomp # C of the characters in '#.TC?' (i.e. one line of the ASCII maze).
        rows << row.split('')
        STDERR.puts row
    end
    #if we founded a control point
    if rows[kr][kc]=='C'
        STDERR.puts "yes"
        control_point = true
    end
    step_index =[[kr,kc-1],[kr+1,kc],[kr,kc+1],[kr-1,kc]]                          # example [[3, 18], [4, 19], [3, 20], [2, 19]]
    step_mass = [rows[kr][kc-1], rows[kr+1][kc], rows[kr][kc+1], rows[kr-1][kc]]   # ["#", ".", "#", "."]
    step_side = ["LEFT", "DOWN", "RIGHT", "UP"]
  
    #STDERR.puts "Debug messages..."
  
    #if control room not founded
    if (!control_point) 
        kirh_turn_side =""
        #count = 0
        step_mass.each_with_index do |elem, index| 
            if (elem =='.' or elem=='C') 
                #если в этой точке мы не были
                if !isVisited(kirh_pass, step_index[index])
                    pass<<index
                    kirh_pass<<step_index[index]
                    kirh_turn_side = step_side[index]
                end
                #elsif (count == 1 && isVisited(kirh_pass, step_index[index]))
                #kirh_turn_side = step_side[index]
            end
            
        end
        puts kirh_turn_side
    #if all dot know and step to control room => reverse pass, or go to short pass
    else 
        reverse_pass(pass).each do |side|
            puts step_side[side]
        end
    end

end
