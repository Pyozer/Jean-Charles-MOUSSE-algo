# Algo exam part .01 -- basics

## Guidelines

All exercises **HAVE TO** be at the root of your repositories.<br />
All exercises **MUST BE** done alone without any help (even in remote, respect the game)<br />
All exercises **MUST BE** done without helpers function like includes for string or contains for array.<br />
All exercises **MUST BE** done with basic language feature like if, else, for, etc.<br />

You **CAN** use the language you want (change js by yours)<br />
You **CAN** add testing files on a **tests** directory

If any exercices **TURNS OUT** to be inspired by a solution find in Internet or from a colleague, you **WILL HAVE** 0 for the whole module

The name of your repositorie **HAVE TO** be `{firstname}-{lastname}-algo`
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

## ex01.js

Implement an algorithm to determine if a string has all unique characters. What if you
can not use additional data structures?

## ex02.js

Write code to reverse a String

## ex03.js

Write a method to decide if two strings are anagrams or not.

# Linked list

## ex04.js

Create a Linked List with 2 methods: **appendToTail(v: T)** and **deleteNode(index: number)**

## ex05.js

Write code to remove duplicates from an unsorted linked list.

## ex06.js

Implement an algorithm to find the nth to last element of a singly linked list.

# Stacks and Queues

## ex07.js

Implement a Stack (LIFO) with 2 methods: **push(v: T)** and **pop()**

## ex08.js

Implement a Queue (FIFO) with 2 methods: **enqueue(v: T)** and **dequeue()**

## ex09.js

How would you design a stack which, in addition to push and pop, also has a function
min which returns the minimum element?<br />
Push, pop and min should all operate in O(1) time.

# Object Oriented Design

## ex10.js

Design the data structures for a generic deck of cards.

## ex11.js

Design a chess game using object oriented principles.

# Recursion

## ex12.js

Write a method to generate the nth Fibonacci number.

## ex13.js

Write a method to compute all permutations of a string.

# Sorting and Searching

## ex14.js

You are given two sorted arrays, A and B, and A has a large enough buffer at the end to hold B. Write a method to merge B into A in sorted order.

## ex15.js

Write a method to sort an array of strings so that all the anagrams are next to each other
