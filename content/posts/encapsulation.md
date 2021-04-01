---
title: "Encapsulation"
date: 2021-04-01T14:41:57+03:00
draft: false
tags: ["oop"]
---

In OOP languages, encapsulation refers to one of two notions, and sometimes to the combination thereof:
1. mechanism for restricting direct access to some of the object's (class) components.
2. a construct that facilitates the bundling of data with the methods operating on that data. 

Publicly accessible methods are generally provided in the class to access or modify the state more abstractly. In practice, sometimes methods (called getters and setters) are provided to access the values indirectly. 

Encapsulation can be achieved by declaring all the variables in the class as private and writing public mehtods in the class to set and get the values of variables. 

### Access modifiers

When talking about encapsulation and data-hind in general, there is no way to get past access modifiers. 
In Java, there are 3 acceess modifiers:
* `private`

This is most restrictive and probably most commonly used modifier. 
If used on method or on variable, it can be only access within the same class. Subclasses or any other class within the same or different packages cant' access. 

* `protected`

Attributes and methods with protected keyword can be access within subclass, by all classes within the same package, and by all subclasses within the same package or another packages.

* `public`

Least restrictive modifier. Basically methods and variables are accessible from anywhere

* `no modifier`

When no modifier provided, you can access its methods and variables within class and from all classes within the same package. 

### Advantages
* Provides control over the data. E.g you want Integer variable to be greater than x. Well, you can write that logic inside the setter method.
* Data hiding - other classes will not be able to access the data through the private data members. 
* Easy to test. 
* Reusable code

### Information hiding
Encapsulation can be used to hide data members and member functions. The internal representation of an object is generally hidden from outside of the object's definition. Typically, only the object's own methods can directly inspect or manipulate its fields. 

Hiding the internals of the object protects its integrity by preventing users from setting the internal data of the component into an invalid or inconsistent state. A supposed benefit of encapsulation is that it can reduce system complexity by allowing the developer to limit the interdecpendencies between software components. 

### Example

```java

class Person {

	/* Everything is private */
	private String givenName;
	private String surname;
	private Integer age;

	// default constructor
	public Person() { }

}

class Encapsulation {

	public static void main(String[] args) {
		Person person = new Person();
		person.givenName = "John";

		// We will get an error, saying that givenName has private access in main.Person
	    System.out.println(person.givenName);
	}
}

// if we change the class Person a little bit
class Person {

	/* given and surnames are public, age is private */
	public String givenName;
	public String surname;
	private Integer age;

	public Person() { }
}

class Encapsulation {

	public static void main(String[] args) {
		Person person = new Person();
		person.givenName = "John";
		person surname = "Doe";

		// now if we print out
	    System.out.println(person.givenName + " " + person.surname);

	    // a wild "John Doe" will appear in the console
	}

}	
```

Better example where 'power of encapsulation' is shown

```java
class Person {

	private String givenName;
	private String surname;
	private Integer age;

	public Person() { }

	public String getFullName() {
		return this.givenName + " " + this.surname;
	}

	public void setAge(Integer newAge) {
		if (newAge < 18) {
			throw new IllegalArgumentException("Too young");
		}
		this.age = newAge;
	}
}
```

The above example has nothing wrong, but there are some risks.

Imagine a wild error occurs. You will have high risk that your object is in inconsistent state which will cause 
huge headace and will take a lot of time to find the bug. 

It is considered good practice to keep all objects immutable. But thats quite hard to manage. 

Consider the <cite>example below[^1]</cite>

```java
class Stack {
	private int size;
	private String[] elements;

	public void push(String element) {
		size++;
		if (size > elements.length) {
			throw new RuntimeException("stack overflow");
		}
		elements[size] = element;
	}
}
```
The problem with above example is that Stack will be left in broken state if it throws exception. 

Its `size` property will be incremented, while `elements` won't get a new element. 
Immutability prevents this 
problem. An object will never be left in broken state, cuz its state is modified only in its constructor. The constructor will either fail or succeed. 

[^1]: This cool example is from [here](https://www.yegor256.com/2014/06/09/objects-should-be-immutable.html)

So the key takeaway for me is that: try to keep as much as possible immutable. 






