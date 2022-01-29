---
title: "Binary Trees"
date: 2021-06-02T15:54:03+03:00
draft: false
tags: ["ds"]
---

One of my favourite data structure. 

#### What is [Binary (Search)] Tree? 

A *tree* is an undirected graph which satisfies any of the following: 
* an acyclic (i.e no cycles) connected graph
* a connected graph with N nodes and N-1 edges.
* an graph in which any two vertices are connected by exactly one path. 

Root node => top most node

If we have a rooted tree then we will want to have a reference to the root node of our tree.

Child node => node that extends from another node. 

Parent node => is the inverse of child node. 

Leaf node => node without no children

Subtree is a tree entirely containt within another tree. 

```
root	 				4 
	   		  		  / | \
parent of 7 and 2  	 0  3  9
    	   		   / |
child / leaf	  7  2

```
#### What is Binary tree? 
A Binary Tree (BT) is a tree for which every node has _at most two child nodes_. 

#### What is Binary Search tree? 
A Binary Search Tree (BST) is a binary tree that satisfies the BST invariant:
* left subtree has smaller elements.
* right subtree has larger elements. 

``` 
Example of BST

			8 
		   / \
		  6   9
		 / \   \
		2   7   11
```

#### When and where to use it? 
* Syntax trees - used by compiler and calcualtors
* Used in the implementation of binary heaps
* Treap - a probabilistic data structure (uses randomized BST).
* Base of other trees. 

#### Complexity of BST

Method | Average   | Worst
-------|-----------|-------
insert | O(log(n)) | O(n)
delete | O(log(n)) | O(n)
remove | O(log(n)) | O(n)
search | O(log(n)) | O(n)

Cool, eh? And very useful! 

If the tree is well structured, it is very good data strcuture and easy to implement. Most of the cases, worst case is not an option. 

Worst case comes into play when the data creates a flat line 'tree' and somehow you need to go through all the way to the last element. 

You can think average case as a case where everytime you cut your search into half. 

#### Implementation

How to implement a tree as BST? 
* make sure that the elements are comparable so that we can order them inside the tree. 

When insterting an element we want to compare its value to the value stored in the current node we're considering to decide on one of the following: 
* recurse down left subtree ( < case )
* recurese down right subtree ( > case )
* handle finding a duplicate value ( = case )
* create a new node ( _null_ case ) 

```
1. insert 7
		
		7

2. insert 20.
		
		7 
	   	  \ 
	   	   20

3. insert 5. 
		
		7 
	   / \ 
	  5   20

4. insert 15.

		7 
	   / \ 
	  5   20
	     / 
	    15

5. insert 10
		
		7 
	   / \ 
	  5   20
	     / 
	    15
	   /
	  10
```
Linear cases are covered with balanced binary search trees.

Removing elements from a BST can be seen as a two step process.
1. find the element we wish to remove (if exists)
2. replace the node we want to remove with its successor to maintain the BST invariant.

Remember: 
BST invariant is where left subtree has smaller element and right subtree has larger elements. 

#### Finding phase
When searching BST for a node with a particular value one of four things will happen:
1. we hit null node at which point we know the value does not exist
2. comparator value equal to 0, (found it)
3. comparator value less than 0 (in left subtree)
4. comparator value greater than 0 (in right subtree)

#### Remove phase
Removing has basically 4 cases:
1. Node to remove is a leaf node
2. Node to remove has a right subtree but no left subtree
3. Node to remove has a left subtree but no right subtree
4. Node to remove has both a left and right subtree

##### Handle each case separately. 
_Case I: Leaf node_

If the node we wish to remove is a leaf node then we may do so without side effect.

```
		8
	   / \
	  5   12
	 / \ 
	3   6

If we just remove 3, then we find it inside the tree and remove it. 
It will cause no side effects.

Result:

		8
	   / \
	  5   12
	   \ 
        6
```


_Case II and III: left or right node has a subtree_

This may be the case that we are trying to remove the root node of the (sub)tree in which case its immediate child becomes the new root.
This is the case where node has either left or right subtree.

```
Suppose we want to remove 9
		5
	   / \
	  4   9
	     /  
 		7 
 	   / \
 	  6   8

First, we find the node 9.
Then remove it.
After that 7 will take its place.

Result:
		5
	   / \
	  4   7
	     / \
 		6   8
```

_Case IV: node to remove has both a left and right subtree_

In this case we have a problem - which node will take removable nodes place? 

There are two options:
1. largest value in the left subtree OR
2. smallest value in the right subtree

This way the BST will satisfy the BST invariants.

```
Remove 9

		5
	   / \
	  4   9
	     / \ 
 		7   11
 	   / \    \
 	  6   8    13

1. find 9 (if we have it)
2. now pick which option to go: 
	- largest from left subtree or
	- smallest form right subtree.
In this case we will go with the largest value.
3. find the largest value from the left subtree.
In our case it will be 8. Go as fas as possible.
4. copy that value from the node found in the subtree to the node we want to remove. 

		5
	   / \
	  4   8
	     / \ 
 		7   11
 	   / \    \
 	  6   8    13

5. Now is the case where we have double 8 in our tree.
But in this case we will have I or II or III case removal.

Result:

		5
	   / \
	  4   8
	     / \ 
 		7   11
 	   /      \
 	  6        13

``` 	  
#### Tree traversals 

* Preorder - prints before the recursive calls. This is basically from largest to smallest. 

* Inorder - prints between recursive calls. This is basically from smallest to largest. 

* Postorder - prints after recursive calls. This works through the subtree and then moves on. 

* Level order - in a level order traversal we want to print the nodes as they appear one layer at a time.

```
		5
	   / \
	  4   8
	     / \ 
 		7   11
 	   /      \
 	  6        13

In level order case we print:
5 - 4 - 8 - 7 - 11 - 6 - 13
``` 	  
First tree traversals are naturally defined recursively.

#### Source code

```java
public class BinarySearchTree<T extends Comparable<T>> {

} 
```


#### Conclusion







