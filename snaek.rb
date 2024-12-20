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
  input = STDIN.getch[0].ord

  case input
  when "w"[0].ord
    direction = Snake::DIRECTION_UP
  when "a"[0].ord
    direction = Snake::DIRECTION_LEFT
  when "s"[0].ord
    direction = Snake::DIRECTION_DOWN
  when "d"[0].ord
    direction = Snake::DIRECTION_RIGHT
  when 27
    break;
  else
    # pass
  end

  unless snake.move!(direction, board)
    break
  end

  if snake.collides_with?(apple)
    snake.elongate!
    apple.randomize!(board)
  end

  board.render(snake, apple)
end
