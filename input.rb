# This doesn't do anything yet, eventually it will handle inputs

require 'ncurses'

def test

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
end
