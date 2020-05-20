abstract class Evolution::Condition
  def initialize(@pokemon : Pokemon)
  end

  # Your evolution method should override one or more of these methods.
  # def evolve_on_level_up?(_);            false; end
  # def evolve_on_use_item?(_);            false; end
  # def evolve_on_trade?(_);               false; end
  # def evolve_on_increase_friendship?(_); false; end
  # def evolve_on_hold_item?(_);           false; end
  # def evolve_on_time_of_day?(_);         false; end
  # # ....more here if this is a good way to do things we'll see
end
