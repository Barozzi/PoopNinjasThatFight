require_relative './mobs/mobs'

class Tank < Mob

  def regen
    ["#{@type} looks better", -(@con)]
  end

end
 

