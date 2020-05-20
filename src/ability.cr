require "./class_named"

abstract class Ability
  include ClassNamed

  private getter pokemon

  def initialize(@pokemon : Pokemon)
  end
end
