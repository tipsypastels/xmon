module TypeChart
  enum Effectiveness
    Super
    Unchanged
    NotVery
    None

    def &(other : Effectiveness) : Effectiveness
      return None  if self == None || other == None
      return other if self == Unchanged
      return self  if other == Unchanged
      return Unchanged # cancel out
    end
  end

  # First type represents the attacking type, second is the defending type.
  # You do not need to define every possible combination of types,
  # only those that are *not* `Effectiveness::Unchanged`.
  private CHART = {
    {Type::Fire, Type::Water} => Effectiveness::NotVery,
    {Type::Water, Type::Fire} => Effectiveness::Super,
  }

  def self.effectiveness(*, of attacking_type, against defending_types) : Effectiveness
    effectivenesses = defending_types.map { |t| CHART.fetch({attacking_type, t}, Effectiveness::Unchanged) }
    effectivenesses.reduce { |e1, e2| e1 & e2 }
  end
end
