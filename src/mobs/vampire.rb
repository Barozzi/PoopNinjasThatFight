require_relative '../mob'

class Vampire < Mob

  def special
    take_damage(-@str/2)    
    ["#{@type}'s eyes glow red!\n#{@type} " + @special_text, (@str/2)]
  end
end
 
