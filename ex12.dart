// EXO 12:
// Write a method to generate the nth Fibonacci number.
//

import 'package:test/test.dart';

int fibonacci(int n) => (n <= 2) ? 1 : fibonacci(n - 2) + fibonacci(n - 1);

int fibonacciOpti(int n, [Map<int, int> cache]) {
  if (n <= 2) return 1;
  cache ??= {};
  if (cache[n] != null) return cache[n];
  return cache[n] = fibonacciOpti(n - 2, cache) + fibonacciOpti(n - 1, cache);
}

void printExecutionTime(Function process) {
  DateTime start = DateTime.now();
  process();
  print(start.difference(DateTime.now()).toString());
}

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
    // Around 8 sec
    printExecutionTime(() => expect(fibonacci(47), equals(2971215073)));
  });

  test("Test a very faster Fibonacci optimized function", () {
    expect(fibonacciOpti(0), equals(1));
    expect(fibonacciOpti(1), equals(1));
    expect(fibonacciOpti(2), equals(1));
    expect(fibonacciOpti(3), equals(2));
    expect(fibonacciOpti(4), equals(3));
    expect(fibonacciOpti(5), equals(5));
    expect(fibonacciOpti(9), equals(34));
    expect(fibonacciOpti(16), equals(987));
    // Around 100 microsec
    printExecutionTime(() => expect(fibonacciOpti(58), equals(591286729879)));
    // Around 600 microsec
    printExecutionTime(
      () => expect(fibonacciOpti(92), equals(7540113804746346429)),
    );
  });
}
