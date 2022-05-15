require "crsfml"
require "scar"

class App < Scar::App
  def init
    Scar::Assets.use "assets"
    Scar::Assets.load "WenQuanYiMicroHei.ttf"
    Scar::Assets.default_font = Scar::Assets.font "WenQuanYiMicroHei.ttf"

    self << Scar::Scene.new

    text_component = Scar::Components::Text.new "Hello World"

    space = Scar::Space.new "Main space"
    space << Scar::Entity.new "text", text_component, position: Scar::Vec.new(32, 16)

    scene << space
  end

  def update(dt)
  end

  def render(dt)
    @window.clear(SF::Color::Black)
  end
end

window = SF::RenderWindow.new SF::VideoMode.new(800, 640), "Hello World", SF::Style::Close
App.new(window).run
