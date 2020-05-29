require "./type_chart/definition_macros"

module TypeChart
  include DefinitionMacros
  @@chart = {} of {Type, Type} => Float32

  def_effectiveness Normal,
    weak_against: {Rock},
    none_against: {Ghost}

  def_effectiveness Fire,
    strong_against: {Bug, Grass, Ice, Steel},
    weak_against: {Dragon, Fire, Rock, Water}

  def_effectiveness Fighting,
    strong_against: {Dark, Ice, Normal, Rock, Steel},
    weak_against: {Bug, Fairy, Flying, Poison, Psychic},
    none_against: {Ghost}

  def_effectiveness Water,
    strong_against: {Fire, Ground, Rock},
    weak_against: {Dragon, Grass, Water}

  def_effectiveness Flying,
    strong_against: {Bug, Fighting, Grass},
    weak_against: {Electric, Rock, Steel}

  def_effectiveness Grass,
    strong_against: {Ground, Rock, Water},
    weak_against: {Bug, Dragon, Fire, Flying, Grass, Poison, Steel}

  def_effectiveness Poison,
    strong_against: {Fairy, Grass},
    weak_against: {Poison, Ground, Rock, Ghost},
    none_against: {Steel}

  def_effectiveness Electric,
    strong_against: {Flying, Water},
    weak_against: {Dragon, Electric, Grass},
    none_against: {Ground}

  def_effectiveness Ground,
    strong_against: {Electric, Fire, Poison, Rock, Steel},
    weak_against: {Bug, Grass},
    none_against: {Flying}

  def_effectiveness Psychic,
    strong_against: {Fighting, Poison},
    weak_against: {Psychic, Steel},
    none_against: {Dark}

  def_effectiveness Rock,
    strong_against: {Bug, Fire, Flying, Ice},
    weak_against: {Fighting, Ground, Steel}

  def_effectiveness Ice,
    strong_against: {Dragon, Flying, Grass, Ground},
    weak_against: {Fire, Ice, Steel, Water}

  def_effectiveness Bug,
    strong_against: {Dark, Grass, Psychic},
    weak_against: {Fairy, Fighting, Fire, Flying, Ghost, Poison, Steel}

  def_effectiveness Dragon,
    strong_against: {Dragon},
    weak_against: {Steel},
    none_against: {Fairy}

  def_effectiveness Ghost,
    strong_against: {Ghost, Psychic},
    weak_against: {Dark},
    none_against: {Normal}

  def_effectiveness Dark,
    strong_against: {Ghost, Psychic},
    weak_against: {Dark, Fairy, Fighting}

  def_effectiveness Steel,
    strong_against: {Fairy, Ice, Rock},
    weak_against: {Electric, Fire, Steel, Water}

  def_effectiveness Fairy,
    strong_against: {Dark, Dragon, Fighting},
    weak_against: {Fire, Poison, Steel}

  # Computes the effectiveness of an attacking type against a Pokemon species.
  def self.effectiveness(*, of attacking_type, against mon : Species)
    effectiveness(of: attacking_type, against: mon.types)
  end

  # Computes the effectiveness of an attacking type against a set of defending types.
  def self.effectiveness(*, of attacking_type, against defending_types)
    effectivenesses = defending_types.map { |t| fetch(attacking_type, t) }
    effectivenesses.reduce { |e1, e2| e1 * e2 }
  end

  # Fetches the effectiveness for a one-on-one type interaction. Does not combine types.
  # There is no need to use this directly, just use `.effectiveness`.
  private def self.fetch(attacking_type, defending_type)
    @@chart.fetch({attacking_type, defending_type}, Regular)
  end
end
