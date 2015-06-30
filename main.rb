require "ncurses"

begin

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

  # Initialize Curse
  Ncurses.initscr

  #Ncurses.mvaddstr(0, 0, map[1][2] + "Make sure this works")
      
  # Draw game map
  for y in 0...10
    for x in 0...15
      if(game_map[y][x] == "#")
        Ncurses.mvaddch(y, x, 35)
      else
        Ncurses.mvaddch(y, x, 32)
      end
    end
  end

  # Player's starting coordinates 
  y = 1
  x = 1

  # Draw player
  Ncurses.mvaddch(y, x, 64);

  # Wait for key press before leaving
  Ncurses.getch
  Ncurses.refresh
  sleep 1000

  # Clean up after we've finished using curses
ensure
  Ncurses.endwin
end

