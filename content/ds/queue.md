---
title: "Queue"
date: 2021-05-27T16:25:32+03:00
draft: false
tags: ["ds"]
---

#### What is Queue? 
A queue is a linear data structure which models real world queues by having two primary operations:
* enqueue - getting into the queue, e.g step into the queue. Enqueue = Adding = Offering
* dequeue - leaving the queue. Dequeue = Polling = Removing from the front.

```
Instruction:
1. Enqueue 12
2. Dequeue 
3. Dequeue
4. Enqueue 7
5. Dequeue 
6. Enqueue 6

Queue: 
Front | 55 1 33 17 11 | Back

1: 55 1 33 17 11 <= 12
2. 55 <= 1 33 17 11 12
3. 1 <= 33 17 11 12
4. 33 17 11 12 <= 7
5. 33 <= 17 11 12 7
6. 17 11 12 7 <= 6

Done: 17 11 12 7 6
```

#### Where is queue used? 
* any waiting line is queue.
* can keep track of the most recent added elements.
* web server request management where you want first come first serve.
* breadth first search graph traversal.

#### Complexity

Method  | Complexity
--------|-------
Enqueue | O(1)
Dequeue | O(1)
Peeking | O(1)
Contains| O(n)
Removal | O(n)
isEmpty | O(1)

* Contains - we need to scan through all the elements.
* Removal - again, we have to go over all the elements.
* Everything else is kept in memory basically. That is, we know where those elements are. 

#### Queue implementation
There are many ways to implement queue data structure. 

You can use static arrays, in which case you have to keep track of how large your array is. Or use dynamic array, which removes that problem. 

Then there are singly linked list and doubly linked list. 
In our case, we use doubly linked list. 

The main goal is to keep track of _head_ and _tail_.
Main idea is to keep the tail pointer on the last element and head pointer on the first element. 

And remember, _nulls_ are removed by garbage collector.

#### Code

```java
public class Queue<T> implements Iterable<T> {

	private java.util.LinkedList<T> list = new java.util.LinkedList<T>();

	public Queue() {

	}

	public Queue(T firstElement) {
		offer(firstElement);
	}

	public int size() {
		return list.size();
	}

	public boolean isEmpty() {
		return list.size() == 0;
	}

	public T peek() {
		if (isEmpty()) {
			throw new RuntimeException("Queue is empty");
		}

		return list.peekFirst();
	}

	// remove first
	public T poll() {
		if (isEmpty()) {
			throw new RuntimeException("Queue is empty");
		}

		return list.removeFirst();
	}

	// add last
	public void offer(T elem) {
		list.addLast(elem);
	}

	@Override
	public java.util.Iterator<T> iterator() {
		return list.iterator();
	}

}
```

#### Queue implementation using static array.
```java
public class ArrayQueue<T> {

	private Object[] data;
	private int head;
	private int tail;

	public ArrayQueue(int capacity) {
		data = new Object[capacity + 1];
		head = 0;
		tail = 0;
	}

	public boolean isEmpty() {
		return head == tail;
	}

	public boolean isFull() {
		return (head + data.length - tail) % data.length == 1;
	}

	public void offer(T elem) {
		if (isFull()) {
			throw new RuntimeException("Queue is full");
		}

		data[tail++] = elem;
		tail = adjustIndex(tail, data.length);
	}

	public T poll() {
		if (isEmpty()) {
			throw new RuntimeException("Queue is empty");
		}

		head = adjustIndex(head, data.length);
		return (T) data[head++];
	}

	public T peek() {
		if (isEmpty()) {
			throw new RuntimeException("Queue is empty");
		}

		head = adjustIndex(head, data.length);
		return (T) data[head];
	}

	public int size() {
		return adjustIndex(tail + data.length - head, data.length);
	}

	private int adjustIndex(int index, int size) {
		return index >= size ? index - size : index;
	}

}


```

#### Conclusion
As we can see, it is a lot easier to implement Queue while using LinkedList. We need to keep in mind where do we take the element - front or back - and that is basically it. 




