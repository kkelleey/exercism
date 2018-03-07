import java.util.stream.IntStream;

class DifferenceOfSquaresCalculator {

    int computeSquareOfSumTo(int input) {
      int sum = numbersUpTo(input).sum();

      return sum * sum;
    }

    int computeSumOfSquaresTo(int input) {
      return numbersUpTo(input).reduce(0, (sum, i) -> sum += i * i);
    }

    int computeDifferenceOfSquares(int input) {
      return computeSquareOfSumTo(input) - computeSumOfSquaresTo(input);
    }

    IntStream numbersUpTo(int n) {
      return IntStream.rangeClosed(1, n);
    }

}
