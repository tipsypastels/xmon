struct Ability::Cloud9 < Ability
  MODIFIER = Battle::Modifiers::WeatherNegated

  def on_enter_battle(battle)
    battle.set_modifier(MODIFIER)
  end

  def on_leave_battle(battle)
    battle.unset_modifier(MODIFIER)
  end
end
