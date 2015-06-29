require "ncurses"

map = [ "###############",
        "#      #      #",
        "#             #",
        "#      ### ####",
        "#### ###   #  #",
        "#          #  #",
        "#          #  #",
        "#             #",
        "#          #  #",
        "###############" ]

# Initialize Curse
Ncurses.initscr

Ncurses.addstr(map[1][0] + "Make sure this works")

# Player's starting coordinates 
y = 1
x = 1
    
# Draw map
for yy in 0..10
  for xx in 0..15
    #win.setpos(yy, xx)
    #scr.mvaddch(yy, xx, map[yy][xx]);
  end
end
# Draw player
#win.setpos(y, x)
#scr.mvaddch(y, x, '@');

# Wait for key press before leaving
Ncurses.refresh
Ncurses.getch

# Clean up after we've finished using curses
Ncurses.endwin