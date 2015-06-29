require "curses"
include Curses

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
Curses.init_screen()

# Create a new Curses
win = Curses::Window.new(40, 40, 0, 0)
win.setpos(0, 0)
#win.addstr(map[1][0] + "Make sure this works")

# Player's starting coordinates 
y = 1
x = 1
    
# draw map
for yy in 0..10
  for xx in 0..15
    #win.setpos(yy, xx)
    win.mvaddch(yy, xx, map[yy][xx]);
  end
end
# draw player
#win.setpos(y, x)
win.mvaddch(y, x, '@');

# wait for key press before leaving
win.refresh
win.getch

# clean up after we've finished using curses
win.close