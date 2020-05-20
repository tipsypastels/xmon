class Pokemon
  property! species : Species
  property! level : Level
  property! ability : Ability
  property! gender : GenderRatio::Gender

  property nickname : String?

  def initialize(
    species species_class : Species.class,
    level : Level,
    ability : Ability.class | Nil = nil,
    nickname : String? = nil,
    gender : GenderRatio::Gender?  = nil
  )
    @species = species_class.new
    @level = level
    @ability = (ability || @species.not_nil!.abilities.sample).new(self)
    @nickname = nickname
    @gender = gender || @species.not_nil!.gender_ratio.sample
  end

  def name
    nickname || species.name
  end

  def hidden_ability?
    ability.class == species.hidden_ability
  end
end
