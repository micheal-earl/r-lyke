require "ncurses"
require "./input.rb"
require "./mobiles.rb"

class Game
  def initialize
    @key = Hash['W'     => 119, 'A'    => 97, 'S'  => 115, 'D'  => 100,
                'POUND' => 35, 'SPACE' => 32, 'AT' => 64, 'ESC' => 27
                'Y'     => 121]
  end

  def generate_map(size)
    map_array = []

    (rand(size) + 4).times do |n|
      map_array[n] = "#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}"\
                     "#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}"\
                     "#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}"\
                     "#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}"
    end

    map_array.each_index do |n|
      for x in 0...20
        if map_array[n][x] == "1"
          map_array[n][x] = "#"
        else
          map_array[n][x] = " "
        end
      end
      map_array[n][0] = "#"
      map_array[n][-1] = "#"
    end

    map_array[0] = "####################"
    map_array[-1] = "####################"

    map_array[1][1] = " "
    map_array[1][2] = " "
    map_array[2][1] = " "
    map_array[2][2] = " "

    return map_array
  end

  def game_loop(scr)
    scr.clear
    game_map = generate_map(15)

    # Players starting coords
    y = 1
    x = 1

    mover = 0 # Initalize variable to hold keyboard input
    debug = 0 # Used for debugging purposes if you didn't guess that

    while mover != @key['ESC']
      scr.clear # Clear the screen from previous iteration

      # Draw the game map
      for rows in 0..game_map.length
        scr.mvaddstr(rows, 0, game_map[rows].to_s)
      end

      # Listen for input and modify player coords
      y -= 1 if mover == @key['W'] && game_map[y-1][x] == " "
      y += 1 if mover == @key['S'] && game_map[y+1][x] == " "
      x -= 1 if mover == @key['A'] && game_map[y][x-1] == " "
      x += 1 if mover == @key['D'] && game_map[y][x+1] == " "
      game_loop(scr) if mover == @key['SPACE']

      scr.mvaddch(y, x, @key['AT']); # Redraw player

      # ==================== DEBUG BLOCK BEGIN ====================
      debug += 1
      scr.mvaddstr(2, 25, "WASD to move, ESC to exit,")
      scr.mvaddstr(3, 25, "SPACE to generate new map")
      scr.mvaddstr(4, 25, "#{x}, #{y}, #{mover} mover #{debug}"\
                          " #{game_map[y-1][x]} #{game_map[y-1][x] == " "}")
      # ===================== DEBUG BLOCK END =====================

      scr.refresh       # Refresh screen
      mover = scr.getch # Get user input for next frame
    end
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

      # Print string to the screen
      Ncurses.stdscr.mvaddstr(10, 35, "Want to play?")
      Ncurses.stdscr.mvaddstr(11, 35, "    Y or N   ")

      # Start the game_loop if user presses Y
      game_loop(Ncurses.stdscr) if Ncurses.stdscr.getch == @key['Y']

    ensure
      # Clean up everything when we're done using ncurses
      Ncurses.echo
      Ncurses.nocbreak
      Ncurses.nl
      Ncurses.endwin
    end
  end
end

rlyke = Game.new

rlyke.init_scr
