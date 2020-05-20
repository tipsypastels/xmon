class Species::Geodude < Species
  def types
    {Types::Rock, Types::Ground}
  end

  def color
    Color::Brown
  end

  def abilities
    {Ability::Sturdy, Ability::RockHead}
  end

  def hidden_ability
    Ability::SandVeil
  end

  def gender_ratio
    GenderRatio.female_50_percent
  end
end
