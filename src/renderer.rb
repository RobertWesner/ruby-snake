class Renderer
  def initialize(width, height)
    @buffer = Array.new(height) { Array.new(width) { "   " } }
    @horizontal_line = '---' * width
  end

  def draw!(x, y, text)
    @buffer[y][x] = text.rjust(2).ljust 3
  end

  def render
    puts "\e[H\e[2J"
    puts "." + @horizontal_line + ".\n"
    @buffer.each do |row|
      puts "|" + row.join("") + "|\n"
    end
    puts "'" + @horizontal_line + "'\n"
  end
end
