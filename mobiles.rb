# This doesn't do anything yet, eventually it will house the mobile class

class Mobile
  attr_accessor :name, :x_coord, :y_coord, :hp, :ascii_icon
  def initialize(name, x_coord, y_coord, hp, ascii_icon)
    @name = name
    @hp = hp
    @ascii_icon = ascii_icon
    @x_coord = x_coord
    @y_coord = y_coord
  end
end
