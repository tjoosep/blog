---
title: "Abstraction"
date: 2021-04-01T16:06:31+03:00
draft: false
tags: ["oop"]
---

<cite>Abstraction[^1]</cite> is the concept of object oriented programming that "shows" only essential attributes and "hides" unnecessary information.

Thus, the main purpose of abstraction is hiding the unnecessary details from the users. 
It helps to reduce programming complexity and efforts. 

#### Example

List top 10 information variables (name, address, etc) of your customer to create a banking application.

Here goes:
1. name
2. income
3. tax information
4. address
5. ...
9. favorite food 
10. favorite movie

What the hell?!

Well.. the amount of information is quite infinite. We only need the relevant ones. 
In essence - we are selecting relevant data from the larger pool. 
But the same set of data can be used in other places, for example in Banking application, Eployee, Hospital and Government databases, etc.

Since we have fetched the customer information from a larger pool, the process is referred as Abstraction in OOP.


### Advantages of Abstraction
* It allows you to group several related classes as siblings
* Helps to reduce the complexity of the design and implementation process
* Avoids code duplications.

### When to use Abstract methods and classes? 
Abstract methods are mostly declared where two or more subclasses are also doing the same thing in different ways through different implementations. It also extends the same Abstract class and offers different implementations of the abstract methods. 

Abstract classes help to describe generic types of behaviors and OOP class hierarchy. It also describes subclasses to offer implementation details of the abstract class. 

Also, there are situations in which we will want to define a superclass or parent class that declares the structure of a given abstraction without providing a complete implementation of every method. 
That means, sometimes we want to create a (super)class that only defines a generalization form that will be shared by all of its subclasses, leaving it to each sublcass to fill in the details. 

### A better example

So how do we know when method or class is abstract enough? 

`abstract` keyword helps us to declare that. 

```java
abstract class Motorbike {

    public Motorbike() {
        System.out.println("Bike has been created!");
    }

    void run() { };

    void changeGear() {
        System.out.println("changed gear");
    }
}

class Honda extends Motorbike {

    @Override
    public void run() {
        System.out.println("Honda is running...");
    }
}

public class Abstraction {

    public static void main(String[] args) {
        Motorbike bike = new Honda(); // bike has been created!
        bike.run();                   // from Honda class
        bike.changeGear();            // comes from abstract parent class
    }
}

```
Output: 
```
Bike has been created!
Honda is running...
changed gear
```

Notice that `new Honda()` was created since it is subclass of Motorbike. And this must be done almost everywhere. 
<cite>See LSP [^2]</cite>

### Another one
A bit advanced place where to use abstraction is in factory pattern. Factory pattern is most commonly used when you want to 
create object without exposing the creatin logic to the client and refer to newly created object using a common interface or abstract class. 

Imagine we want to set different type of prices for different customer behavioural action.
Case is - what kind of price strategy we should use depending on user action? 
Factory patterns comes to rescue us and solves it in runtime. 

```java
public abstract class BasePrice {

	abstract Price processPrice(Price price);

	public final Price process(Price price) {
		//logic how to price processing goes. 
	}
}

public class PriceFactory {

	public static BasePrice create(UserAction action) {
		BasePrice priceStrategy;
		switch (action) {
			case X:
				priceStrategy = new SuspendedPrice();
				break;
			case Y: 	
				priceStrategy = new TerminatePrice();
				break;
			default:
				priceStrategy = new DefaultPrice();
		}
		return priceStrategy;
	}
	
}

public class SuspendedPrice extends BasePrice { 
	
	@Override
	public Price processPrice(Price price) {
		// logic goes here
	}
}

public class TerminatePrice extends BasePrice {
	
	@Override
	public Price processPrice(Price price) {
		// logic goes here
	}
}
```

### Difference between Abstract class and Encapsulation
When you have read and studied about encapsulation, you will have some questions, like aren't they doing the same thing but in different way? 

Let us see the differences:


   Abstraction | Encapsulation
---------------|---------------
Solves the issues at design level | Solves issues at implementation level
Hiding unwanted details while showing most essential ones | Means binding the code and data into single unit
Data abstraction allows focussing on what the information object must contain | Encapsulation means hiding the internal details of how an object does someting for security reasons. 


### Rules of abstract class
1. Class is declared with `abstract` keyword
2. It cannot be instantiated. Will get Compile time exception
3. Can have abstract and non-abstract methods
4. Can have constructor and static methods
5. Can have final methods

**Question.**

Now, you might think - why do we need constructor when we can't instantiate object?

**Answer**. 

First and foremost - constructor does not create the object. Constructor does what we want constructor to do, like initialising fields. 
Secondly, imagine if you have two different subclasses of your abstract class. When you instantiate them, their constructor will be called and the parent constructor will be called (first) and the fields will be initialized. 
If you don't do anything, the default constructor will be called. You can use super keyword to invoke specific constructor on the parent class.  

Consider this:
```java
abstract class Product {
	int multiplyBy;

	public Product(int multiplyBy) {
		this.multiplyBy = multiplyBy;
	}

	public int multiply(int val) {
		return multiplyBy * val;
	}
}

class TimesTwo extends Product {
	public TimesTwo() {
		super(2);
	}
}

class TimesWhat extends Product {
	public TimesWhat(int what) {
		super(what);
	}
}

```

Abstract constructors will frequently be used to enforce class constraints or invariants such as the minimum fields required to setup the class.



[^1]: [Abstraction](https://www.yegor256.com/2014/06/09/objects-should-be-immutable.html)
[^2]: [Liskov Substitution Principle](https://en.wikipedia.org/wiki/Liskov_substitution_principle)




