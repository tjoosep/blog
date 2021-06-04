---
title: "Linked List"
date: 2021-05-25T14:46:54+03:00
draft: false
tags: ["ds"]
---

The next chapter after dynamic arrays would be linked list.

#### What is linked list? 
Linked list is a sequential list of nodes that hold data which point to other nodes containing also some data. 
```
( data ) ==> ( data ) ==> ( data ) ==> null. 
```

Each node has pointer to the next data, while last node is null. 

#### Where are linked lists used? 
* used in list, stack and queues.
* greate for creating circular lists. 
* can easily model real world objects, like trains. 
* often used in adjacency lists for graphs


#### Terminology
```
HEAD: first element of the list
TAIL: last element of the list
Pointer: reference to the next element
Node: object that contains pointer and data
```


#### Sinly and Doubly linked lists
There are two types of linked lists: doubly linked list and sinly linked list
* Doubly linked list holds data, pointer to the next AND pointer to the previous object. 
* Singly linked list hold data and pointer to the next object. 

So the obvious advantage of doubly linked list is that it can be traversed backwards but it takes 2x more memory, 
while singly linked list uses less memory and it is easier to implement, but takes some effort to get previous element. 


#### Implementation details - add and remove
Add object into Singly linked list 
```
Insert 11 where the third node (7) is. 

1. starting linked list: ( 5 ) => ( 23 ) => ( 7 ) => ( 13 )
2. travers to the correct position.
3. create new object ( 11 ).
4. place new object into correct position: 
	( 5 ) => ( 23 ) => ( 7 ) => ( 13 )
					   ( 11 )
5. set new objects pointer to the object that was there before. 
( 11 ) => ( 7 )
6. set previous object pointer to point the new object.
( 23 ) => ( 11 )
7. flat out the list
( 5 ) => ( 23 ) => ( 11 ) => ( 7 ) => ( 13 )
```

Add object into Doubly linked list
```
Insert 11 where the third node (7) is.

1. starting linked list: ( 5 ) <=> ( 23 ) <=> ( 7 ) <=> ( 13 )
2. travers to the correct position.
3. create new object ( 11 ).
4. place new object into correct position: 
	( 5 ) <=> ( 23 ) <=> ( 7 ) <=> ( 13 )
					   ( 11 )
5. set new objects pointer to the object that was there before 
   AND this time point to the previous object as well. 
 <= ( 11 ) <=> ( 7 )
6. set previous object pointer to point the new object.
( 23 ) => ( 11 )
7. flat out the list
( 5 ) <=> ( 23 ) <=> (11) <=> ( 7 ) <=> ( 13 )
```

Remove object from Singly linked list
```
Remove 7 from the list.

1. starting list: ( 5 ) => ( 23 ) => ( 11 ) => ( 7 ) => ( 13 )
2. use 2 pointers - call them (F)irst and (S)econd - 
   starting from the head and next to the head. 
( 5 ) => ( 23 ) => ( 11 ) => ( 7 ) => ( 13 )
  F        S
3. traverse both pointers until second pointer finds removable element. 
( 5 ) => ( 23 ) => ( 11 ) => ( 7 ) => ( 13 )
                      F        S
4. create temp variable that indicates removable object ( 7 ).
5. move second pointer to the next object ( 13 ) 
   (if there is, otherwise null).
( 5 ) => ( 23 ) => ( 11 ) => ( 7 ) => ( 13 )
                      F                 S
6. point first pointer to the second pointers element. 
7. remove temp variable and its pointer. 
8. clean memory if needed. 
```

Remove object from Doubly linked list
```
Remove 7 from the list.

1. starting list: ( 5 ) <=> ( 23 ) <=> ( 11 ) <=> ( 7 ) <=> ( 13 )
2. use 1 pointer starting form the head. 
   we need one because doubly linked list objects 
   have already pointers to next and previous objects. 
3. traverse until we have found the removable object ( 7 ).
4. make changes to removable object previous (11) and next object's pointers (13), 
   so that they point to each other instead of removable object.
5. remove removable object. 
6. clean memory if needed
```

The main takeaway is that we need to manage the pointers! 


#### Complexity

Method   | 		Singly | Doubly
---------------|-------|--------
Search         | O(n)  | O(n)
Insert at head | O(1)  | O(1)
Insert at tail | O(1)  | O(1)
Remove at head | O(1)  | O(1)
Remove at tail | O(n)  | O(1)
Remove middle  | O(n)  | O(n)

* searching is linear, because we have to traverse all the elements in the worst case. 
* insertion to the head and tail is constant because we have pointers to these objects, thus we know where they are. 
* remove at head is constant in both cases for the same reasons as before. 
* remove at tail is linear for sinly linked list because we do not know what is the object previous to the tail is thus we have to traverse the whole list. 
This does not apply to doubly linked list because we know the object previous to the last. 
* remove from the middle is linear because in the worst case we have to seek through n-1 objects. 

#### Implementation of doubly linked list
```java
public class DoublyLinkedList<T> implements Iterable <T> {

	private int size = 0;
	private Node<T> head = null;
	private Node<T> tail = null;

	// data representation class
	private static class Node<T> {
		T data;
		Node<T> next;	
		Node<T> prev;

		public Node(T data, Node<T> previous, Node<T> next) {
			this.data = data;
			this.prev = previous;
			this.next = next
		}

		@Override
		public String toString() {
			return data.toString();
		}
	}

	public int size() {
		return size;
	}

	public boolean isEmpty() {
		// return size == 0;
		return size() == 0;
	}

	/** 
	 * Clear the linked list, O(n)
	 * traverse whole list while setting everything to null
	**/
	public void clear() {
		Node<T> traverser = head; // start to traverse from the head.
		while (traverser != null) {
			Node<T> next = traverser.next;
			traverser.prev = null;
			traverser.next = null;
			traverser.data = null;
			traverser = next;
		}
		head = tail = traverser = null;
		size = 0;
 	}

 	public void add(T element) {
 		addLast(element);
 	}

 	public void addLast(T element) {
 		if (isEmpty()) {
 			head = tail = new Node<T>(element, null, null);
 		} else {
 			Node<T> newObject = new Node<T> (element, tail, null);
 			tail.next = newObject;
 			tail = newObject;
 		}

 		size++;
 	}

 	/**
 	 * Add element to the first - head - position, O(1)
 	**/
 	public void addFirst(T element) {
 		if (isEmpty()) {
 			// previous and next pointers are null, cuz no element in list
 			head = tail = new Node<T> (element, null, null);
 		} else {
            // new object refers to the current head, i.e new <=> old <=> ...
            Node<T> newObject = new Node<T> (element, null, head);
            // current head's previous element refers to the new addable object	
            head.prev = newObject;
            // head is the new object
            head = newObject;
 		}
 		size++;
 	}

 	public T peekFirst() {
 		if (isEmpty()) {
 			throw new RuntimeException("The list is empty!");
 		}
 		return head.data;
 	}

 	public T peekLast() {
 		if (isEmpty()) {
 			throw new RuntimeException("The list is empty!");
 		}
 		return tail.data;
 	}

 	// Remove the first value at the head of the list, O(1)
 	public T removeFirst() {
 		if (isEmpty()) {
 			throw new RuntimeException("The list is empty");
 		}

 		// extract the data and move head pointer to the next node
 		T data = head.data;
 		head = head.next;
 		size--;

 		// if the list is now empty set the tail to null
 		if (isEmpty()) {
 			tail = null;
 		} else {
 			head.prev = null;
 		}

 		// return the removed data
 		return data;
 	}

 	public T removeLast() {
 		if (isEmpty()) {
 			throw new RuntimeException("The list is empty");
 		}

 		T data = tail.data
 		tail = tail.prev;
 		size--;

 		if (isEmpty()) {
 			head = null;
 		} else {
 			tail.next = null;
 		}

 		return data;
 	}

 	// remove a node at a particular index, O(n)
 	public T removeAt(int index) {
 		if (index < 0 || index >= size) {
 			throw new IllegalArgumentException("Invalid index");
 		}

 		int i;
 		Node<T> trav;
 		// search from the front of the list
 		if (index < size / 2) {
 			for (i = 0, trav = head; i != index; i++) {
 				trav = trav.next;
 			}
 		} else {
 			for (i = size - 1, trav = tail; i != index; i--) {
 				trav = trav.prev;
 			}
 		}

 		return remove(trav);
 	}

 	private T remove(Node<T> node) {
 		// handle those cases where removable node is first or last
 		if (node.prev == null) {
 			return removeFirst();
 		}
 		if (node.next == null) {
 			return removeLast();
 		}

 		// refere correct nodes 
 		node.next.prev = node.prev;
 		node.prev.next = node.next;

 		T data = node.data;

 		// cleanup
 		node.data = null;
 		node = node.prev = node.next = null;

 		size--;

 		return data;
 	}

 	public boolean remove(Object obj) {
 		Node<T> trav = head;

 		if (obj == null) {
 			for (trav = head; trav != null; trav = trav.next) {
 				remove(trav);
 				return true;
 			}
 		} else {
 			// search for the object
 			for (trav = head; trav != null; trav = trav.next) {
 				if (obj.equals(trav.data)) {
 					remove(trav);
 					return true;
 				}
 			}
 		}

 		return false;
 	}

 	public int indexOf(Object obj) {
 		int index = 0;
 		Node<T> trav = head;

 		if (obj == null) {
 			for (trav = head; trav != null; trav = trav.next; index++) {
 				if (trav.data == null) {
 					return index;
 				}
 			}
 		} else {
 			for (trav = head; trav != null; trav = trav.next; index++) {
 				if (obj.equals(trav.data)) {
 					return index;
 				}
 			}
 		}

 		return -1;
 	}

 	public boolean contains(Object obj) {
 		return indexOf(obj) != -1;
 	}

 	@Override
 	public java.util.Iterator<T> iterator() {
 		return new java.util.Iterator<T> () {
 			private Node<T> trav = head;
 			
 			@Override
 			public boolean hasNext() {
 				return trav != null;
 			}

 			@Override
 			public T next() {
 				T data = trav.data;
 				trav = trav.next;
 				return data;
 			}
 		}
 	}

 	@Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[ ");
        Node<T> trav = head;
        while (trav != null) {
            sb.append(trav.data + " ");
            trav = trav.next;
        }
        sb.append("]");
        return sb.toString();
    }

}
```
So this was doubly linked list implementation. Singly linked list is much more simpler because there is not need to manage previous references. 

#### Conclusion
Idea is to understand how to manage pointers of a linked list. Once you understand it, there should be no problem to implement the data structure. 
And remember: 
1. HEAD is the first element / object.
2. TAIL is the last element / object. 