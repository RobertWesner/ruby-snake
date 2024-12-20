class Board
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def render(snake, apple)
    board = []
    @height.times do
      board.push(Array.new(@width) { " " })
    end

    snake.segments[1..].each do |segment|
      board[segment.y][segment.x] = "o"
    end
    segment = snake.segments[0]
    board[segment.y][segment.x] = "O"

    board[apple.y][apple.x] = "*"

    puts "\e[H\e[2J"
    puts "." + "-" * @width + ".\n"
    board.each do |row|
      puts "|" + row.join("") + "|\n"
    end
    puts "'" + "-" * @width + "'\n"
  end
end
