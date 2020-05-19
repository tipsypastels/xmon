require "./**"

# TODO: Write documentation for `Xmon`
module Xmon
  VERSION = "0.1.0"

  # TODO: Put your code here
end

geodude = Pokemon.new(Geodude, level: 5, ability: Ability::SandVeil.new)
puts geodude.species.hidden_ability
puts geodude.hidden_ability?
