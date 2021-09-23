# This function is called on every turn of a game. It's how your Battlesnake decides where to move.
# Valid moves are "up", "down", "left", or "right".
# TODO: Use the information in board to decide your next move.
def move(board)
  puts board

  # Height and width of the board
  @height = board[:board][:height]
  @width = board[:board][:width]

  # Get the snakes into an array. Thank you Copilot
  @snakes = board[:you][:snakes]

  # get your snakehead
  @snakeheadx = board[:you][:x]
  @snakeheady = board[:you][:y] 

  # get the snakes body
  @snakebodyx = board[:you][:body][:x]
  @snakebodyy = board[:you][:body][:y]
  @snakelength = board[:you][:body][:length]

 # get where food is
 @food = board[:board][:food]

 # get where hazards are
@hazards = board[:board][:hazards]

@possible_moves = ["up", "down", "left", "right"]

# Avoid the board edges

if @snakeheady == @height -1
  puts "removing up"
  @possible_moves.delete("up")
end

if @snakeheady == 0
  puts "removing down"
  @possible_moves.delete("down")
end

if@snakeheadx == @width -1
  puts "removing right"
  @possible_moves.delete("right")
end

if(@snakeheadx == 0)
  puts "removing left"
  @possible_moves.delete("left")
end

move = @possible_moves.sample  
puts "MOVE: " + move
{ "move": move }
end
