enum Type
  Normal
  Fire
  Fighting
  Water
  Flying
  Grass
  Poison
  Electric
  Ground
  Psychic
  Rock
  Ice
  Bug
  Dragon
  Ghost
  Dark
  Steel
  Fairy
  Unknown

  def effectiveness_against(types)
    TypeChart.effectiveness of: self,
                            against: types
  end
end
