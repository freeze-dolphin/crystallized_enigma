require "crsfml"

class Utils
  @window : SF::Window

  private def initialize(window : SF::Window)
    @window = window
  end

  def self.new(window : SF::Window)
    inst = Utils.allocate
    inst.initialize
    return inst
  end

  def draw_char(font, c, x, y, size = 16, color = SF::Color::White)
    text = SF::Text.new
    text.font = font
    text.string = c
    text.character_size = size
    text.color = color
    text.position = {x, y}

    win = @window
    win.draw text
  end
end
