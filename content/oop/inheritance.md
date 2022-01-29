---
title: "Inheritance"
date: 2021-03-26T14:15:50+02:00
draft: false
tags: ["oop"]
---

The idea behind inheritance is that you can create new classes that are built on top
of existing classes. It means that you use already existing classes while adding
new object specific information.

* Idea is to divide into objects. 
* Has Access Modifiers - public, private, protected
* Objects can move and communicate with each other through member functions
* Supports overloading

Represents the IS-A relationshop which is also knows as a parent-child relationship. 
Also known as generalization. 


#### Without inheritance

``` java
class Tv {
	private Long id;
	private String name;
	private Double price;
	private Integer screenSize;
	private Integer refreshRage;
}
```

```java
public class Mobile {
	private Long id;
	private String name;
	private Double price;
	private String operatingSystem;
	private String company;
}
```

Now we are in trouble if we want to add more attributes that are common. 
Everything will get messy if we have more than, lets say, 5 object with some similar, some different attributes. 
E.g tv has manufacturer, left in stock. Mobile has, for example, a type, a camera...

But as we can see they all have common things, like price, name, etc. 

How to fix it? Inheritance

#### With the inheritance

```java
public class Product {

	private Long id;
	private String name;
	private Double price;

	// constructor
    public Product(String name, Double price) {
        this.name = name;
        this.price = price;
    }

	// getters and setters + toString
}
```

```java
public class TV extends Product
	
	private final Integer refreshRate;
    private final Integer screenSize;

    public LedTV(String name, Double price, Integer refreshRate, Integer screenSize) {
        super(name, price);
        this.refreshRate = refreshRate;
        this.screenSize = screenSize;
    }

    // getters and setters + toString for printing out 
```

```java
class Mobile extends Product {

    private final String operatingSystem;
    private final String company;

    public Mobile(String name, Double price, String operatingSystem, String company) {
        super(name, price);
        this.operatingSystem = operatingSystem;
        this.company = company;
    }

    // getters and setters + toString for printing out 
```


```java

public class Inheritance {

	public static void main(String[] args) {
		Product product = new Product("product A", 10.99);
        System.out.println(product);

        Product mobile = new Mobile("iPhone", 899.99, "iOS", "Apple");
        System.out.println(mobile);

        Product tv = new LedTV("Ultra HD TV", 1099.99, 50, 58);
        System.out.println(tv);
	}
}
``` 

Output: 
```
Product{name='product A', price=10.99}
Mobile{name='iPhone', price=899.99, operatingSystem='iOS', company='Apple'}
LedTV{name='Ultra HD TV', price=1099.99, refreshRate=50, screenSize=58}
```

#### Overloading and Overriding

When talking about inheritance then there will come up two words that might confuse in the beginning - overloading and overriding. 

`Overloading` - same method name but with different parameters and return type. E.g `System.out.println()` has most of the time different parameters. 

`Overriding` - Subclass has the same method as in parent class, but acts differently. 
Usually nice to say with `@Override` annotation.


For example:

```java
class Product {
	// same parameters as before

	public Integer calculatePrice() {
		// calculates the price of current product
	}

}

class Mobile extends Product {
	// same parameters as before

	@Override
	public Integer calculatePrice() {
		// calculates the price of current mobile
	}

	// Overloading
	public void calcualte() {
		// magic #1
	}
	public Double calcualte(double x, double y) {
		// magic #2
	}
	public Integer calcualte(int a, int b) {
		// magic #3
	}
}
```

#### Difference between Overloading and Overriding


   Overloading | Overriding
---------------|------
    Happens inside one class  		   | Occurs in super class and sub class. I.e inheritance is involved
  Name of the method is the same but parameters are different | Name and parameters both are the same
  Increases readability   			   | Using the same method in child class which is already presented in parent class.
  Return type can be same or different | Return type is always the same
  Compile time polymorphism 		   | Run time polymorphism


#### Why use method overloading? 

Overloading makes code cleaner and easier to read. 
Overloading the method - for example `calculate()` method above - lets you use the the same method with the same name
while only changing the parameters. Imagine having `calculate()` method but with different name for each data type...

Keep in mind that it is impossible to have method with same name and with same paramters. Compiler will tell you that. 
Simply changing the return type of two methods with same names will not result in overloading. Again, compiler will tell you that. 

#### Why use method overriding? 

It has two main concepts: 
1. it is used to provide specific implementation of a method which is already defined in parent class. 
2. it is used for runtime polymorphism. (more about it later)

Rules to override: 
1. name and return type must be the same.
2. also the signature of the method should be the same
3. method can only be overridden in sub class, not in the same class (like overloading).
4. overriding method cannot throw checked Exception than checked exception thrown by overridden method. 
E.g If method in parent class throws `IOException` or `ClassNotFoundException` then the same method in subclass cannot throw casual `Exception` because last one is higher in hierarchy. 
5. Overriding method cannot reduce access. It means that if overridden method is defined public, then overriding method cannot be protected or private. BUT it can be other way around - overridden method can be protected and overriding method can be public. 
6. `private`, `static` and `final` methods cannot be overriden in Java. 

You can prevent overriding by using `final` keyword.

### Advantages of using inheritance:
1. code reusability
2. extensibility
3. overriding 
4. data hiding

Types of inheritance in Java
1. single level
	* one parent one child relatsionship
2. multilevel 
	* parent to child to child (e.g): 

	`class A <- class B extends A <- class C extends B`
3. hierarchical
	* one parent with more than one children


### Why multiple inheritance is not suppoert in java?
Consider a case where A, B and C are three classes. 
The class C inherits A and B classes.
If A and B classes have the same method and you call it from child class, there will be uncertainty which method to call - from A or from B class? 

Since compile-time errors are better than runtime errors, Java renders compile-time error if you inherit 2 classes.
So wheter you have same method or different, there will be compile time error.

```java
class A {

	public printMessage(){
		System.out.println("A");
	}
}

class B {

	pulbic printMessage() {
		System.out.println("B");
	}
}

class C extends A, B {   // suppose it is possible

	public static void main(String[] args) {
		C obj = new C();
		obj.printMessage() // which message will be invoked?
	}
}

```




