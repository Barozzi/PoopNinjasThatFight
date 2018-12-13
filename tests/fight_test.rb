require 'minitest/autorun'
require 'minitest/pride'
require_relative '../src/arena'
require_relative '../src/mob'
require_relative '../src/mobs/vampire'


class FightTest < Minitest::Test

  # Play a game and expect there not to have been any errors
  def test_a_battle
    @arena.start_battle
    assert true
  end

  def test_ninja_vs_thing
    ninja = Mob.new(MOBS[:PoopNinja])
    thing = Mob.new(MOBS[:TheThing])
    arena = Arena.new({mob_one: ninja, mob_two: thing})
    arena.start_battle
    assert true
  end

  def test_random_fight
    mob_one = Mob.new(MOBS[MOBS.keys.sample])
    mob_two = Mob.new(MOBS[MOBS.keys.sample])
    arena = Arena.new({mob_one: mob_one, mob_two: mob_two})
    arena.start_battle
    assert true
  end

  def test_vampire_vs_random
    mob_one = Mob.new(MOBS[MOBS.keys.sample])
    mob_two = Vampire.new(MOBS[MOBS.keys.sample])
    arena = Arena.new({mob_one: mob_one, mob_two: mob_two})
    arena.start_battle
    assert true
  end
end

