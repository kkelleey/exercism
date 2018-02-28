class ArmstrongNumbers {

  boolean isArmstrongNumber(int numberToCheck) {
    String numberToCheckString = Integer.toString(numberToCheck);
    int numberOfDigits = numberToCheckString.length();

    double sum = numberToCheckString
      .chars()
      .mapToLong(Character::getNumericValue)
      .mapToDouble(n -> Math.pow(n, numberOfDigits))
      .sum();

    return numberToCheck == (int)sum;
  }

}
