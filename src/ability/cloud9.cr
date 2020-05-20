class Ability::Cloud9 < Ability
  def on_enter_battle(battle)
    battle.weather_effects_negated = true
  end

  def on_leave_battle(battle)
    battle.weather_effects_negated = false
  end
end
