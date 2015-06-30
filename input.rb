require 'ncurses'

begin
  Ncurses.initscr

  while(true)
    ch = Ncurses.getch
    if ch == "w"
      Ncurses.mvaddstr(0, 0, "I'm w!")
    end
  end

ensure
  Ncurses.endwin
end