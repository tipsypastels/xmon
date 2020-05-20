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

  abstract def color

  abstract def abilities
  def hidden_ability; end

  abstract def types

  def type1
    types.first
  end

  def type2
    types.last
  end

  def genders
    {Gender::Female, Gender::Male}
  end
end
