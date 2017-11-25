---
layout: post
title: Javascript - call() and apply() 
comments: true
tags:
- javascript
---

When I first encountered the call() and apply() functions in Javascript, I had difficulty wrapping my head around how they worked. I also wasn't really sure what practical purpose they served. I'm going to explain how these two functions work and what they are used for.

## call()

call() is a function that allows you to execute a function while specifying your own context in which it will run. For example, let's say we had the following function:

	function printPokemonInfo() {
		alert(this.name + ' is Pokemon #' + this.number + ' and is a ' + this.type + ' type.');
	}

This function will print out information about a Pokemon in an alert window. However, something is amiss.

The function is accessing properties off of `this` to display the information. But no Pokemon object is being passed in. And no, this function is not part of an object that contains the properties being accessed.

As it is, this function will execute with all of the accessed values being undefined, which is pretty useless.

Let's also say I have the following variable declared:

	var pokemon = { number: '001', name: 'Bulbasaur', type: 'Grass' };

I can make this function work by calling the call() function like so:

	printPokemonInfo.call(pokemon);

Now I get the expected output:

	Bulbasaur is Pokemon #001 and is a Grass type.

Why on earth would you want to do this? What practical purpose does this serve?  Why not just make the pokemon an argument of the function? I'll explain shortly. But first, I want to also show you apply().

## apply()

Let's take the above example where we use call and replace call with apply:

	printPokemonInfo.apply(pokemon);

We get the exact same result as before. Okay, there must be a difference between the two. Otherwise, why have two different things that do the same thing?

Both call() and apply() take additional arguments that are optional. call() takes a list of optional arguments to pass into the function, whereas apply() takes a single array of arguments to pass in.

I will modify my function to demonstrate how additional arguments work for call():

	function printPokemonInfo(times, adjective) {
		for(var i = 0; i < times; i++){
			alert(this.name + ' is Pokemon #' + this.number + ' and is a ' + this.type + ' type. It is ' + adjective + '.' );
		}
	}

And I'll make the following call:

	printPokemonInfo.call(pokemon, 3, 'cool');

Now I will get three alert dialogs that say:

	Bulbasaur is Pokemon #001 and is a Grass type. It is cool.

As I said before, apply() only takes an array of arguments as an additional argument. So I would have to slightly change what I'm passing in to apply():

	printPokemonInfo.apply(pokemon, [3, 'cool']);

I get the same result. I get three alert dialogs that say:

	Bulbasaur is Pokemon #001 and is a Grass type. It is cool.

## Practical Applications

A great practical purpose of using call() and apply() is to make use of faking subclassing in JavaScript. Although JavaScript is a prototype-based language and not a classical one, you can still perform a facsimile of inheritance by using call() or apply().

Let's say I have the following constructor:

	var Person = function(firstName, lastName) {
		this.firstName = firstName;
		this.lastName = lastName;
	};

This constructor for my Person object takes in two parameters, firstName and lastName. Let's say I wanted to 'subclass' and reuse this constructor for objects that I want to have the same properties as Person objects. I have two 'subclasses', Student and Professor, that make use of the Person constructor code so I don't have to write it again:

	var Student = function(firstName, lastName, major) {
		Person.call(this, firstName, lastName);
		this.major = major;
	};

	var Professor = function(firstName, lastName, department) {
		Person.apply(this, [firstName, lastName]);
		this.department = department;
	};

With the following code, I get an object with a firstName and lastName property:

	var joe = new Person('Joe', 'Smith');
	//	{ firstName: "Joe", lastName: "Smith" }

With the following code, I get an object with a firstName, lastName, and department property:

	var doc = new Professor('Richard', 'Stallman', 'Computer Science');
	//	{ firstName: "Richard", lastName: "Stallman", department: "Computer Science" }

The Student class works similarly:

	var jimmy = new Student('Jimmy', 'Jones', 'Psychology');
	//	{ firstName: "Jimmy", lastName: "Jones", major: "Psychology" }

## Conclusion

The call() and apply() functions allow you to specify a context for a given function, along with any parameters needed for that function. These functions provide a great way to emulate subclassing in JavaScript.
