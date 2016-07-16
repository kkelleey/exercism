class SpaceAge
  attr_reader :seconds

  ORBITAL_PERIODS = {
    earth: 1,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.freeze

  EARTH_SECONDS_PER_YEAR = 365.25 * 24 * 60 * 60

  def initialize(seconds)
    @seconds = seconds
  end

  ORBITAL_PERIODS.keys.each do |planet|
    define_method("on_#{planet}") do
      @seconds / seconds_per_orbit(planet)
    end
  end

  private

  def seconds_per_orbit(planet)
    (ORBITAL_PERIODS[planet] * EARTH_SECONDS_PER_YEAR)
  end
end
