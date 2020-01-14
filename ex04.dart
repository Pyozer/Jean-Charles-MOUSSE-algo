// EXO 04:
// Create a Linked List with 2 methods: appendToTail(v: T) and deleteNode(index: number)
//

import 'package:test/test.dart';

class LinkedList<T> {
  Node<T> head;
  int _length = 0;

  LinkedList();

  int get length => length;

  void appendToTail(T value) {
    if (head == null) {
      head = new Node(value);
      this._length = 1;
      return;
    }

    // Get tail of list
    Node<T> tail = head;
    while (tail.next != null) {
      tail = tail.next;
    }
    // Add value as tail
    Node<T> newTail = new Node<T>(value, tail);
    tail.next = newTail;
    tail = newTail;
    this._length++;
  }

  Node<T> deleteNode(int index) {
    if (this._length <= index) throw IndexError(index, this);

    Node<T> node = this.head;
    for (int i = 0; i < index; i++) {
      node = node.next;
    }
    node.prev?.next = node.next;
    node.next?.prev = node.prev;
    this._length--;

    return node;
  }
}

class Node<T> {
  T value;
  Node<T> next;
  Node<T> prev;

  Node(this.value, [this.prev, this.next]);
}

void main() {
  test("Test LinkedList functions", () {
    LinkedList<String> list = new LinkedList<String>();
    expect(list.head, isNull);
    expect(list.length, equals(0));

    list.appendToTail("Head");
    expect(list.head.prev, isNull);
    expect(list.head.next, isNull);
    expect(list.head.value, equals("Head"));
    expect(list.length, equals(1));

    list.appendToTail("Index 1");
    expect(list.head.prev, isNull);
    expect(list.head.next, isNotNull);
    expect(list.head.next.value, equals("Index 1"));
    expect(list.head.next.prev.value, equals("Head"));
    expect(list.length, equals(2));

    list.appendToTail("Index 2");
    expect(list.head.next.next, isNotNull);
    expect(list.head.next.next.value, equals("Index 2"));
    expect(list.head.next.next.prev.value, equals("Index 1"));
    expect(list.head.next.next.prev.prev.value, equals("Head"));
    expect(list.length, equals(3));

    expect(() => list.deleteNode(5), throwsA(TypeMatcher<IndexError>()));

    Node deletedNode = list.deleteNode(1);
    expect(deletedNode.value, equals("Index 1"));
    expect(list.length, equals(2));

    expect(list.head.next, isNotNull);
    expect(list.head.next.value, equals("Index 2"));
    expect(list.head.next.next, isNull);
    expect(list.head.next.prev, isNotNull);
    expect(list.head.next.prev.value, equals("Head"));

    expect(() => list.deleteNode(2), throwsA(TypeMatcher<IndexError>()));
  });
}
