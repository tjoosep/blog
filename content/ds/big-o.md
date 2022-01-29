---
title: "Big O"
date: 2021-05-21T16:01:58+03:00
draft: false
tags: ["ds"]
---

### Complexity Analysis

As programmers, we often find ourselves asking the same 2 questions:
1. How much time does this algorithm need to finish?
2. How much space does this algorithm needs? 

### Big O
Big O notation gives an upper bound of the complexity, meaning it will give us the worst case, helping to quantify performance as the input size becomes arbitrarily large. 

For example, let us assume we need to find number 7 from the list, starting from the beginning. In this case, we do not care if 7 is in the beginning or in the middle of the list, we care if 7 is last. 

In this case, it is linear, cuz we need to go through all the elements one-by-one until the end / til we find 7.

Big O only cares cares about LARGE inputs. 

### Big O Notations

Name    |  Notation
--------|-----
Constant time     | O(1)
Logarithmic time  | O(log(n))
Linear time 	  | O(n)
Linearithmic time | O(nlog(n))
Quadric time 	  | O(n^2)
Cubic time 		  | O(n^3)
Exponential time  | O(b^n), b > 1
Factorial time 	  | O(n!)


### Properties

O(n + c) = O(n) 

O(cn) = O(n), c > 0

where n is input and c is constant

##### Examples:

f(n) = 7n^3 + 15n^2 + 8 

O(f(n)) = O(n^3)

We do not care about constants because basically they do not matter. 

================================================

Let's have a look the following:

```java
for (i = 0; i < n; i++) {
	for (j = i; j < n; j++) {
		     ^ 
	}
}
```

Why this is O(n^2)? 

It goes like this: 
* we need to figure our from inside out, because inner loops happen first. So let's focus on the second loop.
* since _i_ goes from [0, n) the amount of looping done is directly determine by what _i_ is.
* remark that if _i = 0_, we do _n_ work, if _i=1_, we do _n-1_ work, if _i = 2_, we do _n - 2_ work, etc.

So the question then becomes what is:

(n) + (n-1) + (n-2) + (n-3) + ... + 3 + 2 + 1? 

This turns out to be n(n+1) / 2, 

so big O becomes
O(n(n + 1) / 2) = O(n^2/ 2 + n/2) = O(n^2)

#### Example:

```code
i = 0;
while i < 3 * n Do
	j = 10
	while j <= 50 Do
		j = j + 1
	j = 0
	while j < n * n * n Do 
		j = j + 2
	i = i + 1
```

```code
We will get the following function:
f(n) = 3n * (40 + n^3/2) = 3n / 40 + 3n^4/2 

To break it down:
1. 3n ==> outer while loop, which goes through 3*n
2. 40 + (n^3/2) ==> 40 comes from the first inner loop since 
   j = 10 and we go constant amount times (in this case 50), 
   and n^3 / 2 comes n*n*n and j is incremented 2 times each time. 

since inner while loops are 'inner', we need to multiply them.

And to put it all together we get 
3n / (40  + (3n^4 / 2)) => 3/2n * (n^3 + 80) => remove constants => n * n^3 => n^4

which in big O notation becomes
O(f(n)) = O(n^4)
```

#### Classic examples:
* find all the subsets - O(2^n)
* find all permutations of string - O(n!)
* sorting using mergesort = O(nlog(n))
* iterating over all the cells in matirx of size x by m - O(nm)


#### Notes
* usually, we get O(log(n)) when each iteration makes input (half) smaller 
* usually, we get O(n) when, well, we have to iterate the input all the way through. 
* usually, we get O(n^2), when loop in a loop. 




