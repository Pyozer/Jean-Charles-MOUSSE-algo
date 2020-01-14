// EXO 12:
// Write a method to generate the nth Fibonacci number.
//

import 'package:test/test.dart';

int fibonacci(int n) => (n <= 2) ? 1  : fibonacci(n - 2) + fibonacci(n - 1);

void main() {
  test("Test Fibonacci function", () {
    expect(fibonacci(0), equals(1));
    expect(fibonacci(1), equals(1));
    expect(fibonacci(2), equals(1));
    expect(fibonacci(3), equals(2));
    expect(fibonacci(4), equals(3));
    expect(fibonacci(5), equals(5));
    expect(fibonacci(9), equals(34));
    expect(fibonacci(16), equals(987));
  });
}
