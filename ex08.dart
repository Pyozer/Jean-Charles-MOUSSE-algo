// EXO 08:
// Implement a Queue (FIFO) with 2 methods: enqueue(v: T) and dequeue()
//

import 'package:test/test.dart';

class StackFIFO<E> {
  List<E> _stack = [];

  StackFIFO();

  int get length => this._stack.length;

  void enqueue(E value) {
    this._stack.insert(0, value);
  }

  E dequeue() {
    return this._stack.removeLast();
  }
}

void main() {
  test("Test Stack (FIFO) enqueue and dequeue functions", () {
    StackFIFO<int> myStackLIFO = new StackFIFO();
    myStackLIFO.enqueue(1);
    myStackLIFO.enqueue(2);
    myStackLIFO.enqueue(3);
    myStackLIFO.enqueue(4);
    expect(myStackLIFO.length, equals(4));
    expect(myStackLIFO.dequeue(), equals(1));
    expect(myStackLIFO.dequeue(), equals(2));
    expect(myStackLIFO.dequeue(), equals(3));

    expect(myStackLIFO.length, equals(1));
    expect(myStackLIFO.dequeue(), equals(4));

    expect(myStackLIFO.length, equals(0));
    expect(() => myStackLIFO.dequeue(), throwsA(TypeMatcher<RangeError>()));

    myStackLIFO.enqueue(12);
    myStackLIFO.enqueue(13);
    expect(myStackLIFO.length, equals(2));
    expect(myStackLIFO.dequeue(), equals(12));
    expect(myStackLIFO.dequeue(), equals(13));
    expect(myStackLIFO.length, equals(0));
  });
}
