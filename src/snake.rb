require_relative "coordinate"

class Snake
  attr_reader :segments

  DIRECTION_LEFT = 0
  DIRECTION_RIGHT = 1
  DIRECTION_UP = 2
  DIRECTION_DOWN = 3

  def initialize(x, y)
    @segments = Array.new(3) { Coordinate.new(x, y) }
  end

  def move(direction, board)
    (@segments.length - 1).downto(1) do |i|
      @segments[i].x = @segments[i - 1].x
      @segments[i].y = @segments[i - 1].y
    end

    case direction
    when DIRECTION_LEFT
      @segments[0].x -= 1
    when DIRECTION_RIGHT
      @segments[0].x += 1
    when DIRECTION_UP
      @segments[0].y -= 1
    when DIRECTION_DOWN
      @segments[0].y += 1
    else
      puts("WTF?")
    end

    if @segments[0].x < 0 || @segments[0].x > board.width || @segments[0].y < 0 || @segments[0].y > board.height
      return false
    end

    if @segments.length > 3
      3.upto(@segments.length - 1) do |i|
        if @segments[i].x == @segments[0].x && @segments[i].y ==  @segments[0].y
          return false
        end
      end
    end

    true
  end

  def collides_with(apple)
    @segments[0].x == apple.x && @segments[0].y == apple.y
  end

  def elongate
    @segments.push(Coordinate.new(@segments[-1].x, @segments[-1].y))
  end
end
