class Coordinate
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def randomize(board)
    @x = Random.new.rand(0...board.width)
    @y = Random.new.rand(0...board.height)
  end
end
