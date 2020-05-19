require "./class_named"

abstract class Species
  include ClassNamed

  enum Color
    RED
    BLUE
    YELLOW
    GREEN
    BLACK
    BROWN
    PURPLE
    GRAY
    WHITE
    PINK
  end

  def initialize(@level : Level, @nickname : String = nil)
  end

  abstract def color : Color
  macro color(value)
    def color : Color
      value
    end
  end

  abstract def abilities : Array(Ability)

  abstract def types : {Type, Type}
  macro types(type1, type2)
    def types : {Type, Type}
      {Type::{{type1}}, Type::{{type2}}}
    end
  end

  def type1
    types.first
  end

  def type2
    types.last
  end
end
