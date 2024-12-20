require_relative "renderer"

class Board
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def render(snake, apple)
    renderer = Renderer.new(@width, @height)

    snake.segments[1..].each do |segment|
      renderer.draw! segment.x, segment.y, "[ ]"
    end
    segment = snake.segments[0]
    renderer.draw! segment.x, segment.y, "[:]"

    renderer.draw! apple.x, apple.y, "(')"

    renderer.render
  end
end
