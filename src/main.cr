require "crsfml"

def draw_char(window, font, c, x, y, size = 16, color = SF::Color::White)
  text = SF::Text.new
  text.font = font
  text.string = c
  text.character_size = size
  text.color = color
  text.position = {x, y}

  window.draw text
end

module CrystallizedEnigma
  VERSION = "0.1.0"

  window = SF::RenderWindow.new(
    SF::VideoMode.new(800, 640), "Enigma",
    settings: SF::ContextSettings.new(depth: 24, antialiasing: 8))

  window.vertical_sync_enabled = true

  while window.open?
    while event = window.poll_event
      case event
      when SF::Event::Closed
        window.close
      when SF::Event::KeyReleased
        if event.code == SF::Keyboard::Escape
          window.close
        end
      end

      window.clear SF::Color::Black

      font_wqy = SF::Font.from_file "wqy-microhei.ttc"

      text = SF::Text.new
      text.font = font_wqy
      text.string = "Hello, wqy!\n中文测试"
      text.character_size = 24
      text.color = SF::Color::White

      window.draw text

      color_vortex = SF::VertexArray.new(SF::Quads, 4)

      color_vortex[0] = SF::Vertex.new(SF.vector2(50, 450), SF::Color::Red)
      color_vortex[1] = SF::Vertex.new(SF.vector2(50, 150), SF::Color::Blue)
      color_vortex[2] = SF::Vertex.new(SF.vector2(350, 150), SF::Color::Green)
      color_vortex[3] = SF::Vertex.new(SF.vector2(350, 450), SF::Color::Yellow)

      window.draw color_vortex

      text_vortex_title = SF::Text.new
      text_vortex_title.font = font_wqy
      text_vortex_title.string = "[RGYB Vortex]"
      text_vortex_title.character_size = 16
      text_vortex_title.color = SF::Color::White
      text_vortex_title.position = {60, 130}

      window.draw text_vortex_title

      box = SF::VertexArray.new(SF::LinesStrip, 5)
      box[0] = SF::Vertex.new(SF.vector2(45, 455), SF::Color::White)
      box[1] = SF::Vertex.new(SF.vector2(45, 145), SF::Color::White)
      box[2] = SF::Vertex.new(SF.vector2(355, 145), SF::Color::White)
      box[3] = SF::Vertex.new(SF.vector2(355, 455), SF::Color::White)
      box[4] = SF::Vertex.new(SF.vector2(45, 455), SF::Color::White)

      window.draw box

      draw_char(window, font_wqy, "R", 50, 430)
      draw_char(window, font_wqy, "B", 50, 150)
      draw_char(window, font_wqy, "G", 340, 150)
      draw_char(window, font_wqy, "Y", 340, 430, size = 16, color = SF::Color::Black)

      window.display
    end
  end
end
