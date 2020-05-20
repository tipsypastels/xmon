class Battle
  @[Flags]
  enum Mode
    NormalBattle
    SkyBattle
  end

  @[Flags]
  enum Modifiers
    WeatherNegated
    SelfDestructNegated
  end
end
