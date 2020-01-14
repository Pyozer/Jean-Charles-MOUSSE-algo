// EXO 07:
// Implement a Stack (LIFO) with 2 methods: push(v: T) and pop()
//

import 'package:test/test.dart';

class StackLIFO<E> {
  List<E> _stack;

  StackLIFO(List<E> initialValues) {
    this._stack = initialValues ?? [];
  }

  int get length => this._stack.length;

  void push(E value) {
    this._stack.add(value);
  }

  E pop() {
    return this._stack.removeLast();
  }
}

void main() {
  test("Test Stack (LIFO) push and pop functions", () {
    StackLIFO<int> myStackLIFO = new StackLIFO([1, 2, 3, 4]);
    expect(myStackLIFO.length, equals(4));
    expect(myStackLIFO.pop(), equals(4));
    expect(myStackLIFO.pop(), equals(3));
    expect(myStackLIFO.pop(), equals(2));

    expect(myStackLIFO.length, equals(1));
    expect(myStackLIFO.pop(), equals(1));

    expect(myStackLIFO.length, equals(0));
    expect(() => myStackLIFO.pop(), throwsA(TypeMatcher<RangeError>()));

    myStackLIFO.push(12);
    myStackLIFO.push(13);
    expect(myStackLIFO.length, equals(2));
    expect(myStackLIFO.pop(), equals(13));
    expect(myStackLIFO.pop(), equals(12));
    expect(myStackLIFO.length, equals(0));
  });
}
