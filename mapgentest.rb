# Trying to write a map generation algorithm, this file will be integrated into main when it's completed
require "ncurses"

def generate_organic_map(width, height)
  map_array = []

  for y in 0...height
    map_array[y] = "#{rand(2)}" * width
    for x in 0...width
      map_array[y][x] = rand(2).to_s
    end
  end

  # Replace all 1's with #'s and everying else with spaces
  map_array.each_index do |n|
    for x in 0...map_array[n].length
      if map_array[n][x] == "1"
        map_array[n][x] = "#"
      else
        map_array[n][x] = " "
      end
    end
    # Ensure the left and right of the map are solid walls
    map_array[n][0] = "#"
    map_array[n][-1] = "#"
  end

  map_array[0] = "#" *  map_array[0].length
  map_array[-1] = "#" * map_array[-1].length

  return map_array
end

def do_simulation_step(old_array)
  map_array = old_array

end

def count_alive_neighbors(map_array, x, y)
  count = 0
  for i in -1...2
    for j in -1...2
      neighbour_x = x + i
      neighbour_y = y + j
      if (i == 0 && j == 0)
        # Do nothing
      elsif (neighbour_x < 0 || neighbour_y < 0 || neighbour_x >= map.length || neighbour_y >= map[0].length)
        count += 1
      elsif (map_array[neighour_x][neighbour_y])
        count += 1
      end
    end
  end
  return count
end

def init_scr
  begin
    Ncurses.initscr                 # Initialize ncurses
    Ncurses.curs_set(0)             # Hide cursor
    Ncurses.cbreak                  # Provide unbuffered input
    Ncurses.noecho                  # Turn off input echoing
    Ncurses.nonl                    # Turn off newline translation
    Ncurses.stdscr.intrflush(false) # Turn off flush-on-interrupt
    Ncurses.stdscr.keypad(true)     # Turn on keypad mode

    # Start the game_loop if user presses Y
    game_map = generate_organic_map(rand(30) + 5, rand(10) + 5)
    for rows in 0..game_map.length
      Ncurses.stdscr.mvaddstr(rows, 0, game_map[rows].to_s)
    end

    if Ncurses.stdscr.getch == 32
      Ncurses.stdscr.clear
      Ncurses.echo
      Ncurses.nocbreak
      Ncurses.nl
      Ncurses.endwin
      init_scr
    end

  ensure
    # Clean up everything when we're done using ncurses
    Ncurses.echo
    Ncurses.nocbreak
    Ncurses.nl
    Ncurses.endwin
  end
end

init_scr
