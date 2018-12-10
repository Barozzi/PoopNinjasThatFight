def damage_noun(damage_int)
  case
  when (damage_int < 1)
    "misses"
  when (1..2).to_a.include?(damage_int)
    "tickles"
  when (3..6).to_a.include?(damage_int)
    "hits"
  when (7..10).to_a.include?(damage_int)
    "wounds"
  when (11..13).to_a.include?(damage_int)
    "mauls"
  when (14..17).to_a.include?(damage_int)
    "devestates"
  when (18..20).to_a.include?(damage_int)
    "MULITATES"
  when (21..24).to_a.include?(damage_int)
    "EVISCERATES"
  when (25..26).to_a.include?(damage_int)
    "MANGLES"
  when (27..28).to_a.include?(damage_int)
    "***DEMOLISHES***"
  else
    ">>>ANNIHILATES<<<"
  end
end
