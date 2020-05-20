class Species::Psyduck < Species
  # evolutions do
  #   at_level 33, Golduck
  # end

  def types
    {Types::Water}
  end

  def color
    Color::Yellow
  end

  def abilities
    {Ability::Damp, Ability::Cloud9}
  end

  def hidden_ability
    Ability::SwiftSwim
  end

  def gender_ratio
    GenderRatio.female_50_percent
  end
end
