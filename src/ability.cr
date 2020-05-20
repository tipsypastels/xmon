require "./class_named"

abstract struct Ability
  include ClassNamed

  private getter pokemon

  def initialize(@pokemon : Pokemon)
  end
end
