import 'package:test/test.dart';

class BinaryNode<T extends num> {
  BinaryNode left = null;
  T value;
  BinaryNode right = null;

  BinaryNode(this.value);
}

class Tree<T extends num> {
  BinaryNode<T> root;

  BinaryNode<T> search(T data) {
    return this._searchRecursive(data, this.root);
  }

  BinaryNode<T> _searchRecursive(T value, BinaryNode<T> node) {
    if (node == null) return null;
    if (node.value == value) return node;
    BinaryNode<T> nextNode = (value < node.value) ? node.left : node.right;
    return this._searchRecursive(value, nextNode);
  }

  void insert(T value) {
    if (value == null) return;
    
    final newNode = new BinaryNode<T>(value);
    if (this.root == null) {
      this.root = newNode;
      return;
    }

    BinaryNode<T> currNode = this.root;
    while (currNode != null) {
      if (value < currNode.value) {
        if (currNode.left == null) {
          currNode.left = newNode;
          return;
        }
        currNode = currNode.left;
      } else {
        if (currNode.right == null) {
          currNode.right = newNode;
          return;
        }
        currNode = currNode.right;
      }
    }
  }

  void remove(T value) {
    BinaryNode<T> currentNode = this.root;

    if (currentNode == null) throw "Empty tree";
    if (currentNode.value == value) this.root = null;

    while (currentNode != null) {
      if (value < currentNode.value) {
        if (currentNode.left?.value == value) {
          currentNode.left = null;
        }
        currentNode = currentNode.left;
      } else {
        if (currentNode.right?.value == value) {
          currentNode.right = null;
        }
        currentNode = currentNode.right;
      }
    }
  }
}

void main() {
  test('Test Tree structure', () {
    final tree = new Tree<int>();
    tree.insert(10);
    tree.insert(5);
    tree.insert(13);
    tree.insert(15);
    tree.insert(14);
    tree.insert(12);

    /*
                       10
                      /  \
                    5    13
                        /  \
                      12    15
                          /
                        14
    */

    expect(tree.search(5).value, equals(5));
    expect(tree.search(13).value, equals(13));
    expect(tree.search(10).value, equals(10));
    expect(tree.search(10).left.value, equals(5));
    expect(tree.search(10).right.value, equals(13));
    expect(tree.search(13).right.value, equals(15));
    expect(tree.search(13).left.value, equals(12));
    expect(tree.search(15).left.value, equals(14));
    expect(tree.search(100), isNull);

    tree.remove(13);
    expect(tree.search(10).right, isNull);
    expect(tree.search(13), isNull);
    expect(tree.search(15), isNull);
    expect(tree.search(14), isNull);
  });
}
