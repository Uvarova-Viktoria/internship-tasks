STDOUT.sync = true # DO NOT REMOVE
# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.

# r: number of rows.
# c: number of columns.
# a: number of rounds between the time the alarm countdown is activated and the time the alarm goes off.
r, c, a = gets.split(" ").collect { |x| x.to_i }
STDERR.puts "#{r},#{c},#{a} "

stepik=false

# game loop
loop do
    # kr: row where Kirk is located.
    # kc: column where Kirk is located.
    kr, kc = gets.split(" ").collect { |x| x.to_i }
    STDERR.puts "#{kr},#{kc} "
    rows = []
    r.times do
        row = gets.chomp # C of the characters in '#.TC?' (i.e. one line of the ASCII maze).
        rows << row.split('')
        STDERR.puts row
    end
    if rows[kr][kc]=='C'
        STDERR.puts "yes"
        stepik = true
    end
    #step_mass = [[kr,kc-1],[kr+1,kc],[kr,kc+1],[kr-1,kc]]
    step_mass = [rows[kr][kc-1], rows[kr+1][kc], rows[kr][kc+1], rows[kr-1][kc]]
    STDERR.print step_mass
    step_side = ["LEFT", "DOWN", "RIGHT", "UP"]
    
    STDERR.puts "Debug messages..."
    STDERR.puts stepik
    STDERR.puts step_mass.rindex{|x| (x=='.' or x=='C')}
    if (stepik == false) 
        puts step_side[step_mass.rindex{|x| (x=='.' or x=='C')}]
    else puts step_side[step_mass.find_index{|x| (x=='.' or x=='T')}]
    end
end
