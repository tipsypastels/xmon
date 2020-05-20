# xmon

`xmon` (placeholder name) is an experimental Pokémon game engine, written in crystal. It is extremely early in development. 

### Why?

Why not?

### Notable differences from other engines

`xmon` does not have "PBS files". Instead, it makes liberal use of crystal features like static typing, macros, and enums to define this data inside the code instead. For example, each Pokémon species is a subclass of the abstract `Species` class, defined like so.

```crystal
class Geodude < Species
  def types
    {Types::Rock, Types::Ground}
  end

  def color
    Color::Brown
  end

  def abilities
    {Ability::Sturdy, Ability::RockHead}
  end

  def hidden_ability
    Ability::SandVeil
  end
end

```

Taking this approach with Pokémon, moves, abilities, and most other data removes the need for a PBS compiler (yay!) and ensures type safety at compile time, preventing accidentally typo-ing a Pokémon name and getting a weird error at runtime. However, you do need some familiarity with crystal to successfully make changes.

===

`xmon` also uses crystal code to define your event scripts, rather than a separate UI. e.g., you might define a cutscene something like this. Maybe. I haven't started on that yet.

```crystal
event GetRunningShoesFromMom do
  freeze do
    move MOM do
      down 2
      right 7
      down 1
    end

    say "Mom: Honey! Don't forget these!"
    get_item RunningShoes
    
    say "Mom: Let's see... it comes with lore!"
    say "Mom: Running was invented in 1748 by Thomas Running when he tried to walk twice at the same time."
    say "Mom: Anyways, have fun on your trip #{PLAYER.name}!"
    
    fade_out_in do
      hide_event MOM, permanent: true
    end
  end
end
```

Yay for extensibility! Unifying the event system with the rest of the code allows anyone with the right know-how to define their own event commands at any time (or even monkey-patch existing ones. scary...).