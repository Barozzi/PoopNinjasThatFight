def damage_noun(damage_int)
  case
  when (damage_int < 1)
    "misses"
  when (1..2).to_a.include?(damage_int)
    "tickles"
  when (3..10).to_a.include?(damage_int)
    "hits"
  when (10..20).to_a.include?(damage_int)
    "wounds"
  when (20..40).to_a.include?(damage_int)
    "mauls"
  when (40..80).to_a.include?(damage_int)
    "devestates"
  when (80..160).to_a.include?(damage_int)
    "MULITATES"
  when (160..320).to_a.include?(damage_int)
    "EVISCERATES"
  when (320..440).to_a.include?(damage_int)
    "MANGLES"
  when (440..640).to_a.include?(damage_int)
    "***DEMOLISHES***"
  else
    ">>>ANNIHILATES<<<"
  end
end
