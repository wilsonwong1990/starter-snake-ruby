# This function is called on every turn of a game. It's how your Battlesnake decides where to move.
# Valid moves are "up", "down", "left", or "right".
# TODO: Use the information in board to decide your next move.
def move(board)
  puts board

# Height and width of the board
@height = board[:board][:height]
@width = board[:board][:width]

# all possible moves
@possible_moves = ["up", "down", "left", "right"] 

#get snakes length
@snakelength = board[:you][:length]

# get where food is
@food = board[:board][:food]
   
# get where hazards are
@hazards = board[:board][:hazards]
   
# get your snakehead
@snakeheadx = board[:you][:head][:x]
@snakeheady = board[:you][:head][:y] 

 # get the snakes body
@snakebody = board[:you][:body]

# Got the idea from https://stackoverflow.com/questions/15784503/ruby-method-to-print-and-neat-an-array
p @snakebody
puts @snakebody.inspect
# Check the snake body and avoid a collision. Checks each body part and see if its in an adjacent square to the head
@snakebody.each {
  |piece|
    puts "x: #{piece[:x]}, y: #{piece[:y]}"
    if piece[:x] == @snakeheadx && piece[:y] + 1 == @snakeheady
      @possible_moves.delete("down")
      puts "Body is below head, removing down"
    elsif piece[:x] + 1 == @snakeheadx && piece[:y] == @snakeheady
      @possible_moves.delete("left")
      puts "Body is to left of head, removing left"
    elsif piece[:x] -1 == @snakeheadx && piece[:y] == @snakeheady
      @possible_moves.delete("right")
      puts "Body is to the right of head, removing right"
    elsif piece[:x] == @snakeheadx && piece[:y] - 1 == @snakeheady
      @possible_moves.delete("up")
      puts "Body is above head, removing up"
    else
      puts "No body collisions" 
    end
  }

# Avoid the board edges

if @snakeheady == @height - 1
  puts "removing up"
  @possible_moves.delete("up")
end

if @snakeheady == 0
  puts "removing down"
  @possible_moves.delete("down")
end

if@snakeheadx == @width - 1
  puts "removing right"
  @possible_moves.delete("right")
end

if@snakeheadx == 0
  puts "removing left"
  @possible_moves.delete("left")
end 

# Set the tail with the last element of the body
@snaketail = @snakebody.last

# Avoid the tail
if @snakeheadx == @snaketail[:x] && @snakeheady > snaketail[:y] 
  @possible_moves.delete("down")
  puts "Avoiding tail, removing down"
end
if @snakeheadx == @snaketail[:x] && @snakeheady < snaketail[:y]
  @possible_moves.delete("up")
  puts "Avoiding tail, removing up"
end
if @snakeheady == @snaketail[:y] && @snakeheadx > snaketail[:x]
  @possible_moves.delete("left")
  puts "Avoiding tail, removing left"
end
if @snakeheady == @snaketail[:y] && @snakeheadx < snaketail[:x]
  @possible_moves.delete("right")
  puts "Avoiding tail, removing right"
end
if @snakeheadx > @snaketail[:x] && @snakeheady > @snaketail[:y]
  @possible_moves.delete("down")
  @possible_moves.delete("left")
  puts "Avoiding tail, removing down and left"
end
if @snakeheadx > @snaketail[:x] && @snakeheady < @snaketail[:y]
  @possible_moves.delete("up")
  @possible_moves.delete("right")
  puts "Avoiding tail, removing up and right"
end

# Prints out the possible moves
puts "Remaining moves after removing head collisions and walls"
p @possible_moves
puts @possible_moves.inspect

move = @possible_moves.sample  
puts "MOVE: " + move
{"move": move}
end
