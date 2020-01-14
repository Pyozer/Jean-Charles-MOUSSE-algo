// EXO 08:
// How would you design a stack which, in addition to push and pop, also has a function min which returns the minimum element?
// Push, pop and min should all operate in O(1) time.
//

import 'package:test/test.dart';

class StackElement {
  int value;
  StackElement prevMin;

  StackElement(this.value, [this.prevMin]);
}

class StackMin {
  List<StackElement> _stack = [];
  int _min;

  StackMin();

  int get length => _stack.length;

  int min() {
    if (length == 0) {
      throw new Exception('Stack is empty');
    }
    return _min;
  }

  void push(int value) {
    if (length == 0) {
      _min = value;
      _stack.add(new StackElement(value));
    } else {
      _stack.add(new StackElement(value, new StackElement(_min)));
      if (_min > value) {
        _min = value;
      }
    }
  }

  int pop() {
    StackElement last = _stack.removeLast();
    if (length > 1) {
      _min = last.prevMin.value;
    } else if (length == 1) {
      _min = _stack[0].value;
    } else {
      _min = null;
    }
    return last.value;
  }
}

void main() {
  test("Test Stack (LIFO) with minimum O(1) push and pop functions", () {
    StackMin myStackMin = new StackMin();
    myStackMin.push(2);
    expect(myStackMin.length, equals(1));
    expect(myStackMin.min(), equals(2));

    myStackMin.push(3);
    expect(myStackMin.min(), equals(2));

    myStackMin.push(1);
    expect(myStackMin.min(), equals(1));

    myStackMin.push(4);
    expect(myStackMin.min(), equals(1));

    expect(myStackMin.pop(), equals(4));
    expect(myStackMin.min(), equals(1));

    expect(myStackMin.pop(), equals(1));
    expect(myStackMin.min(), equals(2));

    expect(myStackMin.pop(), equals(3));
    expect(myStackMin.min(), equals(2));

    expect(myStackMin.pop(), equals(2));

    expect(() => myStackMin.min(), throwsException);
    expect(() => myStackMin.pop(), throwsA(TypeMatcher<RangeError>()));
  });
}
