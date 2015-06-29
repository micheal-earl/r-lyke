require "curses"

Curses.init_screen()

win = Curses::Window.new(15, 15, 0, 0)
win.box("|", "-")
win.setpos(1, 1)

win.refresh
win.getch
win.close