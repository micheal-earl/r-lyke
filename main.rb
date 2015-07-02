require "ncurses"
require "./input.rb"
require "./mobiles.rb"

class Game
  @KEY_W = 119
  @KEY_A = 97
  @KEY_S = 115
  @KEY_D = 100
  @KEY_POUND = 35
  @KEY_SPACE = 32
  @KEY_AT = 64
  @KEY_ESC = 27

  def generate_map(size)
    map_array = []

    (rand(size) + 4).times do |n|
      map_array[n] = "#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}#{rand(3)}"
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

    # Key listener?
    mover = 0

    debug = 0 # Used for debugging purposes if you didn't guess that

    while mover != 27
      # Draw game map
      scr.clear
      for rows in 0..game_map.length
        scr.mvaddstr(rows, 0, game_map[rows].to_s)
      end

      # Listen for input and modify player coords
      y -= 1 if mover == 119 && game_map[y-1][x] == " "
      y += 1 if mover == 115 && game_map[y+1][x] == " "
      x -= 1 if mover == 97  && game_map[y][x-1] == " "
      x += 1 if mover == 100 && game_map[y][x+1] == " "
      game_loop(scr) if mover == 32

      # Redraw player
      scr.mvaddch(y, x, 64);

      # Some Debugging stuff
      debug += 1
      scr.mvaddstr(2, 25, "WASD to move, ESC to exit,")
      scr.mvaddstr(3, 25, "SPACE to generate new map")
      scr.mvaddstr(4, 25, "#{x}, #{y}, #{mover} mover #{debug} #{game_map[y-1][x]} #{game_map[y-1][x] == " "}")

      # Refresh screen
      scr.refresh

      # Get char
      mover = scr.getch
    end
  end

  def init_scr
    begin
      # initialize ncurses
      Ncurses.initscr
      Ncurses.curs_set(0)      # Hide cursor
      Ncurses.cbreak           # provide unbuffered input
      Ncurses.noecho           # turn off input echoing
      Ncurses.nonl             # turn off newline translation
      Ncurses.stdscr.intrflush(false) # turn off flush-on-interrupt
      Ncurses.stdscr.keypad(true)     # turn on keypad mode

      Ncurses.stdscr.mvaddstr(10, 35, "Want to play?") # output string
      Ncurses.stdscr.mvaddstr(11, 35, "    Y or N   ") # output string
      #Ncurses.stdscr.getch                             # get a charachter

      game_loop(Ncurses.stdscr) if Ncurses.stdscr.getch == 121 # demo of moving cursor

    ensure
      Ncurses.echo
      Ncurses.nocbreak
      Ncurses.nl
      Ncurses.endwin
    end
  end
end

rlyke = Game.new

puts rlyke.init_scr
