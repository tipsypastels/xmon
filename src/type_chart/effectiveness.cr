module TypeChart
  enum Effectiveness
    Strong
    Regular
    Weak
    None

    def &(other : Effectiveness) : Effectiveness
      return None  if self == None || other == None
      return other if self == Regular
      return self  if other == Regular
      return self  if other == self
      return Regular # cancel out
    end
  end
end
