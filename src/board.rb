class Board
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def render(snake, apple)
    board = []
    @height.times do
      board.push(Array.new(@width) { ' ' })
    end

    snake.segments.each do |segment|
      board[segment.y][segment.x] = 'O'
    end

    board[apple.y][apple.x] = '*'

    print("." + "-" * @width + ".\n")
    board.each do |row|
      print("|" + row.join("") + "|\n")
    end
    print("'" + "-" * @width + "'\n")
  end
end
