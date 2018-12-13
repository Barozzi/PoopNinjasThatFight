require_relative './damage_nouns'
TICK_LENGTH = 1 # time in seconds between rounds
DIE_LIMIT = 60 # lower number makes special abilities like dodge and regen happen more

class Arena
  def initialize(config)
    @mob_one = config[:mob_one]
    @mob_two = config[:mob_two]
    @mobs = [@mob_one, @mob_two]
  end

  def battle_complete?
    !(@mob_one.alive? && @mob_two.alive?)
  end


  def start_battle
    puts "#{@mob_one.type} vs. #{@mob_two.type}  FIGHT!\n\n"
    until (battle_complete?) do
      play_round
      report
      wait_tick
    end
  end

  def play_round
    do_special
    do_attack
    do_regen unless battle_complete?
  end

  def do_special
    do_damage(@mob_one.special, @mob_two) if special?(@mob_one)
    do_damage(@mob_two.special, @mob_one) if special?(@mob_two)
  end

  def do_attack
    @mobs.each_with_index do |mob, index|
      if (mob.alive?)
        target_mob = @mobs[(index ^ 1)]
        if dodge?(target_mob)
          print "\n#{target_mob.type} dodges an attack."
        else 
          do_damage(mob.attack, target_mob)
        end
      end
    end
  end

  def do_regen
    do_damage(@mob_one.regen, @mob_one) if regen?(@mob_one)
    do_damage(@mob_two.regen, @mob_two) if regen?(@mob_two)
  end

  def do_damage(damage_array, target_mob)
    printf("\n"+damage_array[0],
      damage_noun(damage_array[1]),
      target_mob.type)
    target_mob.take_damage(damage_array[1])
  end

  def wait_tick
    sleep TICK_LENGTH
  end

  def special?(mob)
    die_roll < ((mob.str > mob.dex) ? mob.str : mob.dex)
  end

  def dodge?(mob)
    return false if mob.dex < 6
    die_roll < (mob.dex + (mob.dex-6)*3)
  end

  def regen?(mob)
    die_roll < mob.con
  end

  def die_roll
    rand(DIE_LIMIT) # adjust this to tweak game length
  end

  def restore_them_all
    @mobs.each{|mob| mob.take_damage(-mob.max_hp)}
    self
  end

  def kill_them_all
    @mobs.each{|mob| mob.take_damage(mob.max_hp)}
    self
  end

  def kill_mob_by_number(mob_num)
    target_mob = @mobs[mob_num-1]
    target_mob.take_damage(target_mob.max_hp)
    self
  end

  def report
    puts ""
    puts "#{@mob_one.type}:#{@mob_one.hp} || #{@mob_two.type}:#{@mob_two.hp}" unless battle_complete?
    puts "Combatant one, #{@mob_one.type} wins the battle!" if @mob_one.alive? && !@mob_two.alive?
    puts "Combatant two, #{@mob_two.type} wins the battle!" if !@mob_one.alive? && @mob_two.alive?
  end

end
