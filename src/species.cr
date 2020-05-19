require "./class_named"

abstract class Species
  include ClassNamed

  enum Color
    Red
    Blue
    Yellow
    Green
    Black
    Brown
    Purple
    Gray
    White
    Pink
  end

  getter level
  property nickname

  abstract def color : Color
  macro color(name)
    def color : Color
      Species::Color::{{name}}
    end
  end

  abstract def abilities : Array(Ability)
  def hidden_ability : Ability?; end

  macro abilities(*names, hidden = nil)
    def abilities : Array(Ability)
      [
        {% for name in names %}
          Ability::{{name}}.new,
        {% end %}
      ] of Ability
    end

    {% if hidden %}
      def hidden_ability : Ability
        Ability::{{hidden}}.new
      end
    {% end %}
  end

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
