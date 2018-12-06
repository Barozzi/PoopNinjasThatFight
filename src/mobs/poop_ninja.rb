require_relative '../mob'

class PoopNinja < Mob
  def initialize
    @type =  'PoopNinja'
    @str =  6
    @dex =  16
    @con =  8
    @max_hp = @con * 10
    @hp = @max_hp
    @damage_type = 'fart'
    @special_text = 'Performs a handstand and fumigates'
  end
end
