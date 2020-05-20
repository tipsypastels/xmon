# A gender ratio defines the probability of a Pokémon being each gender. Some Pokémon are always female or male, and some have no gender at all, but most have a probability of being either male or female. You can use the `GenderRatio` class to pick from common ratios or define your own.
#
# The following class methods exist for common gender ratios:
#
# ```
# GenderRatio.all_male
# GenderRatio.female_12_point_5_percent
# GenderRatio.female_25_percent
# GenderRatio.female_50_percent
# GenderRatio.female_75_percent
# GenderRatio.female_87_point_5_percent
# GenderRatio.all_female
# GenderRatio.genderless
# ```
#
# However, you can also define your own custom ratios like this.
#
# ```
# GenderRatio.new(female: 1 / 3) # 1 / 3 female, 2 / 3 male
# GenderRatio.new(male: 1 / 3) # 1 / 3 male, 2 / 3 female
# ```
struct GenderRatio
  enum Gender
    Female
    Male
    Genderless
  end

  def self.all_male
    @@all_male ||= new(female: 0)
  end

  def self.female_12_point_5_percent
    @@female_12_point_5_percent ||= new(female: 0.125)
  end

  def self.female_25_percent
    @@female_25_percent ||= new(female: 0.25)
  end

  def self.female_50_percent
    @@female_50_percent ||= new(female: 0.5)
  end

  def self.female_75_percent
    @@female_75_percent ||= new(female: 0.75)
  end

  def self.female_87_point_5_percent
    @@female_87_point_5_percent ||= new(female: 0.875)
  end

  def self.all_female
    @@all_female ||= new(female: 1)
  end

  def self.genderless
    @@genderless ||= new(female: 0, male: 0, genderless: 1)
  end

  def self.new(*, female : Float64)
    new(female: female, male: 1.0 - female)
  end

  def initialize(*, female : Float64, male : Float64, genderless : Float64 = 0)
    if (female + male + genderless) != 1.0
      raise "the female, male and genderless components must add up to exactly 1.0"
    end

    @female     = female
    @male       = male
    @genderless = genderless
  end

  def sample : Gender
    x = rand
    puts x
    puts @female
    puts @male
    puts @genderless

    case x
    when (0..@female)
      Gender::Female
    when (@female..(@female + @male))
      Gender::Male
    else
      Gender::Genderless
    end
  end
end
