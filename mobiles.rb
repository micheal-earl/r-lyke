# This doesn't do anything yet, eventually it will house the mobile class

class Mobile
  attr_accessor :name, :hp, :ascii_icon
  def initialize(name, hp, ascii_icon)
    @name = name
    @hp = hp
    @ascii_icon = ascii_icon
  end
end
