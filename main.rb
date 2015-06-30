require "ncurses"

KEY_W = 119
KEY_A = 97
KEY_S = 115
KEY_D = 100
KEY_POUND = 35
KEY_SPACE = 32
KEY_AT = 64

game_map = [  "###############",
              "#      #      #",
              "#             #",
              "#      ### ####",
              "#### ###   #  #",
              "#          #  #",
              "#          #  #",
              "#             #",
              "#          #  #",
              "###############"  ]

begin
  # Initialize Curse
  Ncurses.initscr
  # Hide terminal cursor
  Ncurses.curs_set(0)

  mover = 0
  debug = 0 #Used for debugging purposes if you didn't guess that

  # Players starting coords
  y = 1
  x = 1

  while mover != 27
    # Draw game map
    for yy in 0...10
      for xx in 0...15
        if(game_map[yy][xx] == "#")
          Ncurses.mvaddch(yy, xx, KEY_POUND)
        else
          Ncurses.mvaddch(yy, xx, KEY_SPACE)
        end
      end
    end

    y -= 1 if mover == KEY_W && game_map[y-1][x] == " "
    y += 1 if mover == KEY_S && game_map[y+1][x] == " "
    x -= 1 if mover == KEY_A && game_map[y][x-1] == " "
    x += 1 if mover == KEY_D && game_map[y][x+1] == " "

    # Some Debugging stuff
    debug += 1
    Ncurses.mvaddstr(15, 15, "#{x}, #{y}, #{mover} mover #{debug} #{game_map[y-1][x]} #{game_map[y-1][x] == " "}")

    # Redraw player
    Ncurses.mvaddch(y, x, KEY_AT);

    Ncurses.refresh
    mover = Ncurses.getch
  end
ensure
  Ncurses.endwin
end
