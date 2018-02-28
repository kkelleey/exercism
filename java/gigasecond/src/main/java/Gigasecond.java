import java.time.LocalDate;
import java.time.LocalDateTime;

class Gigasecond {
  LocalDateTime birthDateTime;
  long gigaseconds = (long) Math.pow(10, 9);

    Gigasecond(LocalDate birthDate) {
      this.birthDateTime = birthDate.atStartOfDay();
    }

    Gigasecond(LocalDateTime birthDateTime) {
      this.birthDateTime = birthDateTime;
    }

    LocalDateTime getDate() {
      return this.birthDateTime.plusSeconds(gigaseconds);
    }

}
