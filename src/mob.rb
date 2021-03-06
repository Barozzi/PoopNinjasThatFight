require_relative './mobs/mobs'

class Mob
  def initialize(config)
    @type = config[:type] || 'Growley'
    @str = config[:str] || 10
    @dex = config[:dex] || 10
    @con = config[:con] || 10
    @max_hp = @con * 10
    @hp = @max_hp
    @damage_type = config[:damage_type] || 'scratch'
    @special_text = config[:special_text] || "Lowers its head and charges"
  end
  #     - Interface: special, attack, takeDamage, isAlive, getStatus
  attr_reader :str, :dex, :con, :hp, :max_hp, :type, :damage_type, :special_text

  # Special move
  def special
    ["#{@type} " + @special_text, (@str/2)]
  end

  def attack
    ["#{@type}'s #{@damage_type} %s %s", @str]
  end

  def regen
    ["#{@type} looks better", -(@con/2)]
  end

  def take_damage(n)
    @hp -= n
    @hp = @max_hp if (@hp > @max_hp)
  end

  def alive?
    @hp > 0
  end

end
