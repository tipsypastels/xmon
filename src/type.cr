# The list of types in the game.
# See `./type_chart.cr` for type effectiveness.
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
