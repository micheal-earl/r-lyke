require 'ncurses'

KEY_W = 119
KEY_A = 97
KEY_S = 115
KEY_D = 100

begin
  Ncurses.initscr

  while(true)
    ch = Ncurses.getch
    case ch
    when KEY_W
      Ncurses.mvaddstr(0, 0, "UP")
      Ncurses.refresh
    when KEY_S
      Ncurses.mvaddstr(0, 0, "DOWN")
      Ncurses.refresh
    when KEY_A
      Ncurses.mvaddstr(0, 0, "LEFT")
      Ncurses.refresh
    when KEY_D
      Ncurses.mvaddstr(0, 0, "RIGHT")
      Ncurses.refresh
    end
  end

ensure
  Ncurses.endwin
end
