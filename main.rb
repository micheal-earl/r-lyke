require "ncurses"

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
  Ncurses.refresh
  Ncurses.getch
  sleep 1000

ensure
  Ncurses.endwin
end
