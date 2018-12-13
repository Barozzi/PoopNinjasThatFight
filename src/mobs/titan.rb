require_relative './mobs/mobs'

class Titan < Mob

  # Special move
  def special
    ["#{@type} " + @special_text, (@str)]
  end
end
 
