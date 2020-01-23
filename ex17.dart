import 'package:test/test.dart';

class BinaryNode<T extends num> {
  BinaryNode left;
  T value;
  BinaryNode right;

  BinaryNode(this.value);
}

class Tree<T extends num> {
  BinaryNode<T> _root;

  BinaryNode<T> get root => this._root;

  BinaryNode<T> search(T data) {
    return this._searchRecursive(data, this._root);
  }

  BinaryNode<T> _searchRecursive(T value, BinaryNode<T> node) {
    if (node == null) return null;
    if (node.value == value) return node;
    BinaryNode<T> nextNode = (value > node.value) ? node.left : node.right;
    return this._searchRecursive(value, nextNode);
  }

  void insert(T value) {
    final newNode = new BinaryNode<T>(value);

    if (this._root == null) {
      this._root = newNode;
      return;
    }

    BinaryNode<T> currNode = this._root;
    while (currNode != null) {
      if (value < currNode.value) {
        if (currNode.left == null) {
          currNode.left = newNode;
          return;
        } else {
          currNode = currNode.left;
        }
      } else {
        if (currNode.right == null) {
          currNode.right = newNode;
          return;
        } else {
          currNode = currNode.right;
        }
      }
    }
  }

  void remove(T value) {
    BinaryNode<T> currentNode = this._root;

    if (currentNode == null) throw "Empty tree";
    if (currentNode.value == value) this._root = null;

    while (currentNode != null) {
      if (value < currentNode.value) {
        if (currentNode.left != null && currentNode.left.value == value) {
          currentNode.left = null;
        } else {
          currentNode = currentNode.left;
        }
      } else {
        if (currentNode.right != null && currentNode.right.value == value) {
          currentNode.right = null;
        } else {
          currentNode = currentNode.right;
        }
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
  });
}
