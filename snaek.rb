require "io/console"
require_relative "src/board"
require_relative "src/snake"

board = Board.new(32, 18)
snake = Snake.new(0, 0)

apple = Coordinate.new(0, 0)
apple.randomize!(board)

direction = Snake::DIRECTION_RIGHT
snake.move!(direction, board)

while true
  system "stty raw -echo"
  input = ""
  while (c = (STDIN.read_nonblock(1).ord rescue nil)) do
    input = c
  end
  system "stty -raw echo"

  sleep 0.2

  case input
  when "w"[0].ord
    if direction != Snake::DIRECTION_DOWN
      direction = Snake::DIRECTION_UP
    end
  when "a"[0].ord
    if direction != Snake::DIRECTION_RIGHT
      direction = Snake::DIRECTION_LEFT
    end
  when "s"[0].ord
    if direction != Snake::DIRECTION_UP
      direction = Snake::DIRECTION_DOWN
    end
  when "d"[0].ord
    if direction != Snake::DIRECTION_LEFT
      direction = Snake::DIRECTION_RIGHT
    end
  when 27
    break;
  else
    # pass
  end

  unless snake.move! direction, board
    break
  end

  if snake.collides_with? apple
    snake.elongate!
    apple.randomize! board
  end

  board.render snake, apple
end
