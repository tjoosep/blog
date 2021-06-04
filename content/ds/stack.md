---
title: "Stack"
date: 2021-05-27T00:26:03+03:00
draft: false
tags: ["ds"]
---

#### What is Stack? 
A stack is one-ended linear data structure which models a real world stack by having two primary operations - push and pop.

* push => add top of the data pile.
* pop  => take from the top of data pile. 

Everything happens on the top.

#### Where is stack used?

* used by undo command.
* used in compilers - e.g checking for matching brackets and braces. 
* used in recursion.
* can be used to do a depth first search (DFS).

#### Complexity Analysis

Method | Time Complexity
-------|---------------
pushing   | O(1)
popping   | O(1)
peeking   | O(1)
searching | O(n)
size      | O(1)

Nothing much to comment here.
* Pushing, popping, peeking and size are pointers to specific element, thus O(1).
* To search element, we need to go through whole stack, thus O(n).

#### Bracket example
```
let S be a stack

for bracket in brackets:
	reversed_bracket = getReversedBracket(bracket)
	if isLeftBracket(bracket): 
		S.push(bracket)
	else if S.isEmpty() or S.pop() != reversed_bracket:
		return false; // invalid

return S.isEmpty()    // empty then good
```

#### Implementation
Instructions

```
push(4)
push(2)
push(5)
push(13)

null
push(4): 4 -> null
push(2): 2 -> 4 -> null
push(5): 5 -> 2 -> 4 -> null
push(13): 13 -> 5 -> 2 -> 4 -> null

Head is pointing always to the top element.

popping is reverse method to the popping while handling memory
```

```java
public class Stack<T> implements Iterable<T> {

	// or use the self created linked list
	private java.util.LinkedList<T> list = new java.util.LinkedList<T>();

	// empty stack
	public Stack() {

	}

	// create stack with initial element
	public Stack(T elem) {
		push(elem);
	}

	// nr of elements in stack
	public int size() {
		return list.size()
	}

	public boolean isEmpty() {
		return size() == 0;
	}

	public void push(T elem) {
		list.addLast(elem);
	}

	public T pop() {
		if (isEmpty()) {
			throw new EmptyStackException();
		}
		return list.removeLast();
	}

	public T peek() {
		if (isEmpty()) {
			throw new EmptyStackException();
		}
		return list.peekLast();
	}

	@Override
	public java.util.Iterator<T> iterator() {
		return list.iterator();
	}
}
```

#### Conclusion
If you understand how linkedlist works, then stack is quite easy to implement. 
Internally you will use list where you take out elements. In list, each element will be at the end of the list. 
In stack, popping and pushing will manage first element. 

So taking out last element from linked list is equal to taking out first element of stack. If that made sense. 


















