require 'minitest/autorun'
require_relative '../src/mob'


class MobTest < Minitest::Test

  def setup
    @test_mob = Mob.new({})
  end

  # Constraints
  def test_combined_mob_stats_equal_30
    stats_total = @test_mob.str + @test_mob.dex + @test_mob.con
    assert_equal stats_total, 30, 'Mobs must have a combined stat total of 30'
  end

  def test_that_mobs_combined_stats_equal_30
    MOBS.keys do |key|
      current_mob = MOBS[key]
      assert_equal (current_mob[:str] + current_mob[:dex] + current_mob[:con]), 30, 'all mob configs should have combined stats of 30'
    end
  end

  def test_mob_type_length
    assert @test_mob.type.length < 10, 'A Mobs type must not be longer than 10'
  end

  def test_mobs_type_length
    MOBS.keys do |key|
      current_mob = MOBS[key]
      assert current_mob.type.length < 10, 'A Mobs type must not be longer than 10'
    end
  end

  def test_damage_type_length
    assert @test_mob.damage_type.length < 10, 'A Mobs damage_type must not be longer than 10'
  end

  def test_mobs_damage_type_length
    MOBS.keys do |key|
      current_mob = MOBS[key]
      assert current_mob .damage_type.length < 10, 'A Mobs damage_type must not be longer than 10'
    end
  end

  def test_special_text_length
    assert @test_mob.special_text.length < 50, 'A Mobs special_text must not be longer than 50'
  end

  def test_mobs_special_text_length
    MOBS.keys do |key|
      current_mob = MOBS[key]
      assert current_mob .special_text.length < 50, 'A Mobs special_text must not be longer than 50'
    end
  end

  # Methods
  ## special
  def test_special_method
    assert_equal @test_mob.special, ["#{@test_mob.type} #{@test_mob.special_text}", (@test_mob.str/2)]
  end

  ## attack
  def test_attack_damage
    assert_equal @test_mob.attack[1], @test_mob.str
  end

  def test_attack_string
    assert_equal @test_mob.attack[0], "#{@test_mob.type}'s #{@test_mob.damage_type} %s %s"
  end

  ## take_damage
  def test_take_damage
    hp = @test_mob.hp
    @test_mob.take_damage(1)
    assert_equal @test_mob.hp, hp-1, "expect take_damage to apply damage to mob"
  end

  def test_take_damage_heal
    hp = @test_mob.hp
    @test_mob.take_damage(1)
    @test_mob.take_damage(-1)
    assert_equal @test_mob.hp, hp, "expect take_damage to heal when applying negative"
  end

  def test_take_damage_heal_too_much
    @test_mob.take_damage(-1e6)
    assert_equal @test_mob.hp, @test_mob.max_hp, 'Heals should not heal more than max hp'
  end

  ## alive?
  def test_alive_while_alive
    assert @test_mob.hp > 0
    assert @test_mob.alive?, 'Alive should be true when hp > 0'
  end

  def test_alive_while_dead
    @test_mob.take_damage(@test_mob.hp)
    assert !@test_mob.alive?, 'Alive should return false when hp == 0'
  end

  def test_alive_while_very_dead
    @test_mob.take_damage(1e6)
    assert @test_mob.hp < 0
    assert !@test_mob.alive?, 'Alive should return false when hp < 0'
  end
end
