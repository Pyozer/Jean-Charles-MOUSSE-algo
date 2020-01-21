// EXO 04:
// Create a Linked List with 2 methods: appendToTail(v: T) and deleteNode(index: number)
//

import 'package:test/test.dart';

class LinkedList<T> {
  Node<T> head;
  Node<T> tail;
  int _length = 0;

  LinkedList();

  int get length => _length;

  Node<T> findNode(int index) {
    if (_length <= index) throw IndexError(index, this);

    Node<T> node = head;
    for (int i = 0; i < index; i++) {
      node = node.next;
    }
    return node;
  }

  void appendToTail(T value) {
    if (head == null) {
      head = new Node(value);
      tail = head;
      _length = 1;
      return;
    }
    // Add value as tail
    Node<T> newTail = new Node<T>(value, tail);
    tail.next = newTail;
    tail = newTail;
    _length++;
  }

  Node<T> deleteNode(Node<T> node) {
    node.prev?.next = node.next;
    node.next?.prev = node.prev;
    _length--;
    return node;
  }

  Node<T> deleteNodeIndex(int index) {
    if (_length <= index) throw IndexError(index, this);
    return deleteNode(findNode(index));
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

    expect(() => list.deleteNodeIndex(5), throwsA(TypeMatcher<IndexError>()));

    Node deletedNode = list.deleteNodeIndex(2);
    expect(deletedNode.value, equals("Index 2"));
    expect(list.length, equals(2));

    expect(list.head.next, isNotNull);
    expect(list.head.next.value, equals("Index 1"));
    expect(list.head.next.next, isNull);
    expect(list.head.next.prev, isNotNull);
    expect(list.head.next.prev.value, equals("Head"));

    deletedNode = list.deleteNodeIndex(1);
    expect(deletedNode.value, equals("Index 1"));
    expect(list.length, equals(1));

    expect(() => list.deleteNodeIndex(2), throwsA(TypeMatcher<IndexError>()));
  });
}
