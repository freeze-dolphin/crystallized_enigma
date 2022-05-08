require "crsfml"

module CrystallizedEnigma
  VERSION = "0.1.0"

  window = SF::RenderWindow.new(SF::VideoMode.new(800, 600), "Enigma")

  window.vertical_sync_enabled = true

  # run the program as long as the window is open
  while window.open?
    # check all the window's events that were triggered since the last iteration of the loop
    while event = window.poll_event
      # "close requested" event: we close the window
      if event.is_a? SF::Event::Closed
        window.close
      end
    end

  end
end
