---
title: "Polymorphism"
date: 2021-04-01T16:08:10+03:00
draft: false
tags: ["oop"]
---

The word "Polymorphism" comes from two words - "poly" which means many and "morphs" which means forms. 
Polymorphism => Many forms. It means it will allow us to perform a single acion in different ways.
Think about it for a sec after the post. It all adds up. 

In Java, all objects are polymorphic as they are all derived from the `Object` class and thus it fulfills IS-A relatsionship 
with the Object class. 

### Example

```java
public class Addition {
	
	public void addition(int a, int b) {
		System.out.println(a + b);
	}

	public void addition(String x, String y) {
		System.out.println(x + "" + y);
	}
}

public Polymorphism {

	public static void main(String[] args) {
		Addition add = new Addition();
		add.addition(2, 3);
		add.addition("one", "two");
	}
}

```
Output:
```
5
OneTwo
```

As seen from the example above, we called same method but with different arguments. 

`Same method -> Different arguments => One method with many forms.`

BTW, System.out.println is also 'polymorphic' method.

### Types of polymorphism

#### Compile-time
As name suggest it happens in compile time. 

Whenever compiler tries to compile, it checks any errors etc. 
And software will not run when there are some, for example, some overloading problems.


##### Example
```java
class Calculator {

	public Integer add(Integer a, Integer b) {
		return a + b;
	}

	public Integer add(Integer x, Integer y, Integer z) {
		return x + y + z;
	}
}

class CompileTime {

	public static void main(String[] args) {
		Calculator calc = new Calculator();
		System.out.println(calc.add(1,2,3));
		System.out.println(calc.add(1,2));
	}
}

```


#### Run-time
As name here suggest - it happens in run time.

What is run-time? Run-time describes software that is executed while your program is running, especially those instructions that you did not write explicitly, but are necessary for the proper execution of your code.

Usually achieved with method overriding in Java. 

##### Example
Below example demonstrates things that we already know - inheritance, method overriding etc. 

Why run-time? Because magic happens when `animal.makeSound()` is being called. 

```java
class RunTime {

	public static void main(String[] args) {
		Animal animal = new Dog();
		animal.makeSound();
	}
}


class Animal {

    public void makeSound() {
        System.out.println("Animal made sound");
    }
}

class Dog extends Animal {

    @Override
    public void makeSound() {
        System.out.println("Dog barked");
    }
}
```


#### Better example
Imagine you must build theme park software. One task it to check if customer is allowed to go to the attraction. Let's say he or she must be at least 12 years old.

Usually kids have school student card or identification card with them. 

So at first it might look something like this

```java
public class IdentificationCard {

	private String personalCode;

	public IdentificationCard(String personalCode) {
		this.personalCode = personalCode;
	}

	public boolean isAtleast12YearsOld() {
		int currentYear = LocalDate.now().getYear();
		return getBirthDateFromIDCard() <= currentYear - 12;
	}

	private int getBirthDateFromIDCard() {
		// read document dates and return year
	}
}

public class StudentCard {
	private int birthYear;

	public StudentCard(int birthYear) {
		this.birthYear = birthYear;
	}

	public boolean isAtleast12YearsOld() {
		return birthYear + 12 <= LocalDate.now().getYear();
	}
}

public class Rollercoaster {

	public boolean goodEnoughtToEnterAttraction(IdentificationCard[] idCards, StudentCard[] studentCards) {
		for (IdentificationCard idCard : idCards) {
			if (!idCard.isAtleast12YearsOld()) {
				return false;
			}
		}

		for (StudentCard studentCard : studentCards) {
			if (!studentCard.isAtleast12YearsOld()) {
				return false;
			}
		}

		return true;
	}
}
```

So far so good, right? 

Well... 

Add another identification card and you are in trouble. There are tons of different documents that can identify your age, e.g driving license.

How to fix it? 

First, we can see that each document has own implementation of how to check if customer is at least 12 years old. 

`goodEnoughtToEnterAttraction()` does not care how each customer age is calculated, nor cased what kind of document it is dealing with.

So here comes the Interface - it describes set of methods. Emphasis on the word _describes_.

What it means? Let's see

```java
public interface Document {
	public boolean isAtleast12YearsOld();
}

public class IdentificationCard implements Document {
	// same as before
}

public class StudentCard implements Document {
	// same as before
}
```


Now in the `Rollercoaster` class, we are able to check age like this
```java
public class Rollercoaster {
	public boolean goodEnoughtToEnterAttraction(Document[] documents) {
		for (Document document : documents) {
			if (!document.isAtleast12YearsOld()) {
				return false;
			}
		}
		return true;
	}
}
```

See the difference? It is quite nice, since each identification document has its own way to calculate required age and each document has contraction `Document` that keeps them together. 
Meanwhile each class that implements `Document` has like two types - classe's own type and interface type. 












