class Pokemon
  property! species : Species
  property! level : Level
  property! ability : Ability

  property nickname : String?

  def initialize(species : Species | Species.class, level : Level, ability : Ability? = nil, nickname : String? = nil)
    @species = species.is_a?(Species) ? species : species.new
    @level = level
    @ability = ability || @species.not_nil!.abilities.sample
    @nickname = nickname
  end

  def name
    nickname || species.name
  end

  def hidden_ability?
    ability == species.hidden_ability
  end
end
