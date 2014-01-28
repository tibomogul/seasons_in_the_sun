require_relative './modern_mid_latitude_meteorological'

# http://blog.rubybestpractices.com/posts/gregory/059-issue-25-creational-design-patterns.html
module SeasonsInTheSun

  STRATEGIES = {
    modern_mid_latitude_meteorological: ModernMidLattitudeMeteorological
  }
  
  WINTER = "Winter"
  SUMMER = "Summer"
  AUTUMN = "Autumn"
  SPRING = "Spring"

  def self.instances
    @instances ||= {}
  end
  def self.[](strategy)
    instances[strategy] ||= create(strategy)
  end
  def self.version_string
    "SeasonsInTheSun version #{SeasonsInTheSun::VERSION}"
  end
  def self.create(strategy=:modern_mid_latitude_meteorological)
    instances[strategy] ||= begin
      if STRATEGIES.has_key?(strategy)
        STRATEGIES[strategy].new
      else
        raise "Unknown Strategy"
      end
    end
  end

end
