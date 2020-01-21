# Algo exam part .01 -- basics

## Run project

You must have Dart installed (or use DartPad online).

Run `pub get` in terminal to install dependencies (test).

To run all test just do `pub run test ./ex*.dart`

To run only one test you can do `pub run test ./ex01.dart`

## Guidelines

All exercises **HAVE TO** be at the root of your repositories.<br />
All exercises **MUST BE** done alone without any help (even in remote, respect the game)<br />
All exercises **MUST BE** done without helpers function like includes for string or contains for array.<br />
All exercises **MUST BE** done with basic language feature like if, else, for, etc.<br />

You **CAN** use the language you want (change [lang] by yours)<br />
You **CAN** add testing files on a **tests** directory

If any exercices **TURNS OUT** to be inspired by a solution find in Internet or from a colleague, you **WILL HAVE** 0 for the whole module

The name of your repositorie **HAVE TO** be `{firstname}-{lastname}-algo`<br />
You **HAVE TO** create a `.author.json` file with the following content:

```sh
$> cat .author.json
{
  "firstname": "Majdi",
  "lastname": "Toumi",
}
```

> Well, replace Majdi and Toumi ;p

# Arrays and Strings

## ex01.[lang]

Implement an algorithm to determine if a string has all unique characters. What if you
can not use additional data structures?

## ex02.[lang]

Write code to reverse a String

## ex03.[lang]

Write a method to decide if two strings are anagrams or not.

# Linked list

## ex04.[lang]

Create a Linked List with 2 methods: **appendToTail(v: T)** and **deleteNode(index: number)**

## ex05.[lang]

Write code to remove duplicates from an unsorted linked list.

## ex06.[lang]

Implement an algorithm to find the nth to last element of a singly linked list.

# Stacks and Queues

## ex07.[lang]

Implement a Stack (LIFO) with 2 methods: **push(v: T)** and **pop()**

## ex08.[lang]

Implement a Queue (FIFO) with 2 methods: **enqueue(v: T)** and **dequeue()**

## ex09.[lang]

How would you design a stack which, in addition to push and pop, also has a function
min which returns the minimum element?<br />
Push, pop and min should all operate in O(1) time.

# Object Oriented Design

## ex10.[lang]

Design the data structures for a generic deck of cards.

## ex11.[lang]

Design a chess game using object oriented principles.

# Recursion

## ex12.[lang]

Write a method to generate the nth Fibonacci number.

## ex13.[lang]

Write a method to compute all permutations of a string.

# Sorting and Searching

## ex14.[lang]

You are given two sorted arrays, A and B, and A has a large enough buffer at the end to hold B. Write a method to merge B into A in sorted order.

## ex15.[lang]

Write a method to sort an array of strings so that all the anagrams are next to each other

# Graphs and trees

Tree and Graph are non-linear data structures, where the tree represents a relationship between the nodes in a hierarchical structure and the graph follows a network model.<br />
Tree and graph are different in that a tree must be connected and can never have loops while in the graph there are no restrictions.

## ex16.[lang]

Implement a simple graph with methods: `addNode`, `removeNode`, `addEdge`, `removeEdge`, `sort(func: Function)`

## ex17.[lang]

Implement a tree and add methods, to add, find and delete a node based on it's value

## ex18.[lang]

Implement a function to check if a tree is balanced

> For this exercise, a balanced tree is defined to be a tree such that no two leaf nodes differ in distance from the root by more than one

## ex19.[lang]

Given a sorted array, write an algorithm to create a binary tree with minimal height

## ex20.[lang]

Finally, you have to implement 2 main graph searching algorithms:

- Depth First Search: involves searching a node and all its children before proceed- ing to its siblings
- Breadth First Search: involves searching a node and its siblings before going on to any children