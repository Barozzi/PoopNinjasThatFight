require_relative '../mob'

class TheThing< Mob
  def initialize
    @type =  'Thing'
    @str = 15
    @dex = 4
    @con = 11
    @max_hp = @con * 10
    @hp = @max_hp
    @damage_type = 'SMASH'
    @special_text = 'The Thing says, "Its clobbering time!"'
  end
end
