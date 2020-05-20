class Geodude < Species
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

  #... more stuff
end
