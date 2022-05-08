require "crsfml"

module CrystallizedEnigma
  VERSION = "0.1.0"

  window = SF::RenderWindow.new(SF::VideoMode.new(800, 600), "Enigma")

  window.vertical_sync_enabled = true

  while window.open?
    while event = window.poll_event
      case event
      when SF::Event::Closed
        window.close
      end
    end

    window.clear SF::Color::Black

  end
end
