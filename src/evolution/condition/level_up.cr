class Evolution::Condition::LevelUp < Evolution::Condition
  def initialize(pokemon : Pokemon)
    super(pokemon)
    @level = level
  end

  def evolve_on_level_up?(to current_level : Level)
    current_level >= @level
  end
end
