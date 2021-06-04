---
title: "Dynamic Array"
date: 2021-05-24T15:47:21+03:00
draft: false
tags: ["ds"]
---

Probably the most fundamental data structure. 

#### What is an Array? 
* a static array is an fixed length container containing _n_ elements indexable from range [0, n-1].

##### What is _indexable_?
It means that each slot in the array can be referenced with a number.


#### When and where is Array used?
1. sotring and accessing sequential data

2. temporarily storing objects

3. used by I/O routines as buffers

4. lookup tables and invers lookup tables

5. can be used to return multiple values from a function

6. used in dynamic programming to cahce answers to subproblems

#### Complexity

method | static array | dynamic array
--------|-----|----
access | O(1) | O(1)
search | O(n) | O(n)
insert | N/A  | O(n)
append | N/A  | O(1)
delete | N/A  | O(n)

* Access in static and in dynamic array are both constant. That is because both of them are indexable. 

* Search is linear time. Potentially, we have to traverse all the elements in array. For exaple if element is not in the list. 

* Insert, append and deletion are not available for staty arrays, because static arrays are fixed size. So it does not make any sense. 

* Insertion for dynamic array, however, is linear, because you potentially have to shift every element to the right side, copy everything to new static array, add new element and put everything back. 

* Append is constant. We know the size of static inner array and thus just add new element to new _indexable_ position. 

* Deleteion is linear, because you have to to shift every element like in insertion and copy every element into static array. 


Below is and example of array with its elements {12, 44, -5, 22} and arrows are showing its indexes. 
![array](/array.png)

Array indexing is zero-based, meaning the first element is found in position zero. 

```
array[0] = 12
array[1] = 44
array[2] = -5 
array[3] = 22
array[4] = error, Index out of bounds. 
```
If we want to add new element to already taken position, the previous element will be overwritten. 
For example, lets say we want to add element 18 to the third position (index=2). The array will become:

```
array[2] := 18

array[0] = 12
array[1] = 44
array[2] = 18 => -5 is overwritten. 
array[3] = 22
```

#### Operations
Dyanamic array can grow and shrink in size.

```
Starting array: A = [34, 4]
A.add(-2) => A = [34, 4, -2]
A.add(34) => A = [34, 4, -2, 34]
A.remove(4) => > A = [34, -2, 34]
```

#### How to implement dynamic array? 
1. cretea a static array with an inital capacity
2. add elements to the underlying static array, keeping track of the number of the elements. 
3. if adding another element will exceed the capacity, then create a new static array with twice (!) the capacity and copy the original elements into it. 

##### Example
Suppose we create a dynamic array with an initial capacity of two and then begind adding elements to it. 

```
1. capacity of two
[_, _]
* add 7
[7, _]
* add 9
[7, 9]

* add 3
2. now array size is exceeded and we need to 
create new static array with twice the capacity and copy previous elements
[7, 9, _, _] => add 3 => [7, 9, 3, _]
* add 12
[7, 9, 3, 12]
```

### Lets code dynamic array!
```java
public class Array<T> implements Iterable<T> {
	private T[] arr;
	private int len = 0; 	  // length user thinks the array is
	private int capacity = 0; // actual size

	// create 2 constructors - one with default capacity, the other one with parameter given.
	public Array() {
		this(8);
	}

	public Array(int capacity) {
		if (capacity < 0) {
			throw new IllegalArgumentException("Illegal Capacity: " + capacity);
		}

		this.capacity = capacity;
		arr = (T[]) new Object[capacity];
	}

	public int size() {
		return len;
	}

	public boolean isEmpty() {
		// size() == 0;
		return len == 0;
	}

	public T get(int index) {
		if (index >= len) {
			throw new IndexOutOfBoundsException();
		}
		return arr[index];
	}

	public void set(int index, T element) {
		if (index >= len) {
			throw new IndexOutOfBoundsException();
		}
		arr[index] = element;
	}

	/**
	 * quite straight forward - just sett each element to null in the list
	 * and set length of array to 0.
	**/
	public void clear() {
		for (int i = 0; i < capacity; i++) {
			arr[i] = null;
		}
		len = 0;
	}

	public void add(T elem) {
		// if length is higher or equal to capacity, resize (double) the array
		if (len + 1 >= capacity) {
			if (capacity == 0) {
				capacity = 1;
			} else {
				capacity *= 2;
			}

			// create new temporar array with new capacity.
			T[] newArr = (T[]) new Object[capacity];

			// copy all previous elements to temp array
			for (int i = 0; i < len; i++) {
				new_arr[i] = arr[i];
			}

			// and set temp array to correct array
			arr = newArr;
		}

		arr[len++] = elem;
	}

	/**
	* {1,2,3,4}.removeAt(2) => 3
	* new array => {1, 2, 4};
	*/
	public T removeAt(int removableIndex) {
		if (removableIndex >= len && removableIndex < 0) {
			throw new IndexOutOfBoundsException();
		}
		// element to be removed
		T dataToBeRemoved = arr[removableIndex];

		// create new array with -1 size
		T[] newArray = (T[]) new Object[len - 1];

		// copy everything into new array except element at the removable index.
		for (int i = 0, j = 0; i < len; i++, j++) {
			if (i == removableIndex) {
				// this line tells not to add element on the removable position
				j--;
			} else {
				newArray[j] = arr[i];
			}
		}
		arr = newArray;
		capacity = --len;
		return dataToBeRemoved;
	}

	public boolean remove(Object obj) {
		for (int i = 0; i < len; i++) {
			if (arr[i].equals(obj)) {
				removeAt(i);
				return true;
			}
		}
		return false;
	}

	public int indexOf(Object obj) {
		for (int i = 0; i < len; i++) {
			if (arr[i].equals(obj)) {
				return i;
			}
		}
		return -1;
	}

	public boolean contains(Object obj) {
		return indexOf(obj) != -1;
	}

	@Override
	public String toString() {
		if (len == 0) {
			return "[]";
		} else {
			StrinbBuilder sb = new StringBuilder(len).append("[");
			for (int i = 0; i < len - 1; i++) {
				sb.append(arr[i] + ", ");
			}
			return sb.append(arr[len - 1] + "]").toString();
		}
	}
}
```

#### Conclusion
So now we have went through all the basic methods that appear on in dynamic array world.
The most 'complicated' methods are _removeAt()_ and _add()_.

The idea behind dynamic arrays is the following:
* it is using static arrays to manage everything internally 
* when reaching to the maximum size, double the size when next element is being added

That is it! 





