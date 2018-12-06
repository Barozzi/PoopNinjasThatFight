require 'minitest/autorun'
require 'minitest/pride'
require_relative '../src/arena'
require_relative '../src/mob'


class ArenaTest < Minitest::Test
  def setup
    @arena = Arena.new ({mob_one: Mob.new, mob_two: Mob.new});
  end

  # battle_complete?
  def test_battle_complete
    assert !@arena.battle_complete?, 'Expect battle not to be complete when both mobs are alive.'
  end

  def test_battle_complete_with_dead_mobs
    assert @arena.kill_them_all.battle_complete?, 'Expect battle to be complete when both mobs are dead.'
  end

  def test_battle_complete_with_one_dead_mob
    assert @arena.kill_mob_by_number(1).battle_complete?, 'Expect battle to be complete when mob one is dead'
    @arena.restore_them_all
    assert @arena.kill_mob_by_number(2).battle_complete?, 'Expect battle to be complete when mob two is dead'
  end

  # Play a game and expect there not to have been any errors
  def test_a_battle
    @arena.start_battle
    assert true
  end

end
