import java.util.HashMap;

class SpaceAge {
  double seconds;

  private static final double EARTH_SECONDS_PER_YEAR = 31557600;
  private static final HashMap<String, Double> PeriodMap = new HashMap <String, Double> () {{
    put("Mercury", 0.2408467);
    put("Venus", 0.61519726);
    put("Mars", 1.8808158);
    put("Jupiter", 11.862615);
    put("Saturn", 29.447498);
    put("Uranus", 84.016846);
    put("Neptune", 164.79132);
  }};

    SpaceAge(double seconds) {
      this.seconds = seconds;
    }

    double getSeconds() {
      return this.seconds;
    }

    double onEarth() {
      return this.seconds / EARTH_SECONDS_PER_YEAR;
    }

    double onMercury() {
      return seconds / secondsPerYearOn("Mercury");
    }

    double onVenus() {
      return seconds / secondsPerYearOn("Venus");
    }

    double onMars() {
      return seconds / secondsPerYearOn("Mars");
    }

    double onJupiter() {
      return seconds / secondsPerYearOn("Jupiter");
    }

    double onSaturn() {
      return seconds / secondsPerYearOn("Saturn");
    }

    double onUranus() {
      return seconds / secondsPerYearOn("Uranus");
    }

    double onNeptune() {
      return seconds / secondsPerYearOn("Neptune");
    }

    private double secondsPerYearOn(String planet) {
      return EARTH_SECONDS_PER_YEAR * PeriodMap.get(planet);
    }

}
