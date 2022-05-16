require "crsfml"
require "scar"

TITLE = "Crystallized Enigma"
WINDOW_SIZE = {800, 640}

class App < Scar::App
  def init
    Scar::Assets.use "assets"
    Scar::Assets.load_all
    Scar::Assets.default_font = Scar::Assets.font "fonts/WenQuanYiMicroHei.ttf"

    self << Scar::Scene.new

    text_component = Scar::Components::Text.new "Hello World\n中文测试"

    space = Scar::Space.new "Main space"
    space << Scar::Entity.new "text", text_component, position: Scar::Vec.new(32, 16)

    scene << space
  end

  def update(dt)
    while event = @window.poll_event
      case event
      when SF::Event::KeyReleased
        if event.code == SF::Keyboard::Escape
          @window.close
        end
      when SF::Event::Closed
        @window.close
      end
    end
  end

  def render(dt)
    @window.clear(SF::Color::Black)

    color_vortex = SF::VertexArray.new(SF::Quads, 4)

    color_vortex[0] = SF::Vertex.new(SF.vector2(50, 450), SF::Color::Red)
    color_vortex[1] = SF::Vertex.new(SF.vector2(50, 150), SF::Color::Blue)
    color_vortex[2] = SF::Vertex.new(SF.vector2(350, 150), SF::Color::Green)
    color_vortex[3] = SF::Vertex.new(SF.vector2(350, 450), SF::Color::Yellow)

    window.draw color_vortex

    box = SF::VertexArray.new(SF::LinesStrip, 5)
    box[0] = SF::Vertex.new(SF.vector2(45, 455), SF::Color::White)
    box[1] = SF::Vertex.new(SF.vector2(45, 145), SF::Color::White)
    box[2] = SF::Vertex.new(SF.vector2(355, 145), SF::Color::White)
    box[3] = SF::Vertex.new(SF.vector2(355, 455), SF::Color::White)
    box[4] = SF::Vertex.new(SF.vector2(45, 455), SF::Color::White)

    window.draw box

  end
end

def fetch_settings
  settings = SF::ContextSettings.new
  settings.antialiasing_level = 4
  return settings
end

window = SF::RenderWindow.new SF::VideoMode.new(WINDOW_SIZE[0], WINDOW_SIZE[1]), TITLE, SF::Style::Close, fetch_settings
desktop_mode = SF::VideoMode.desktop_mode
window.position = SF.vector2i(desktop_mode.width - WINDOW_SIZE[1] - (desktop_mode.width // 10).to_i, desktop_mode.height // 10)
App.new(window).run
