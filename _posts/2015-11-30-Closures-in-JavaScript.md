---
layout: post
title: Closures in JavaScript 
comments: true
tags:
- javascript
---

#Closures in JavaScript

In a previous post, I discussed some subtleties in regard to different ways to define functions in JavaScript, as well as a number of JavaScript features and how they relate to the various ways functions can be defined. I want to build upon that last post and discuss another interesting feature of JavaScript: closures. 

Closures seem to be one of those concepts that people have difficulty grasping until they're shown how simple they really are. Most people seem to agree that they grasped closures more easily when shown examples.

Here is some code:

	function race(distance) {
		var totalDistance = 0;
		var move = function() { 
			totalDistance += distance; 
			alert("Moved " + distance + " for " + totalDistance + " total.");
		};

		return move;
	}

Within the function `race` I create a function called `move` and return it. In JavaScript, this is nothing special. There's not really anything crazy going on here. A parameter is passed into `race`, there are some assignments, and there is an alert within the returned function.

With this function available, I'll write some more code:

	var walker = race(2);
	walker(); //Moved 2 for 2 total.
	walker(); //Moved 2 for 4 total.

First I call race, passing in a value of 2, and assign the result to `walker`. `walker` now references a function.

Within `race`, when `move` is created, it knows about the local variables within `race`. This is due to the fact that JavaScript has [lexical scoping](https://en.wikipedia.org/wiki/Scope_%28computer_science%29#Lexical_scope_vs._dynamic_scope) with [function scope](https://en.wikipedia.org/wiki/Scope_%28computer_science%29#Function_scope). As a result, a function that is created will have access to the variables within the parent function, even after the parent function terminates.

At the start of `race`, `totalDistance` is set to 0. It ALSO knows about any parameters passed into the function. In our case the parameter is `distance`, whose value is 2.

When I invoke `walker` the first time, it knows that `totalDistance` is 0. After all, that was the value when the parent function returned. It adds `distance`, whose value was also 2 when the parent function terminated, to `totalDistance`, giving it a total of 2. The alert then gets called.

I invoke `walker` again. `walker` still knows about the same variables as it did before. It knows that `distance` has a value of 2 and `totalDistance` also has a value of 2. `distance` is added to `totalDistance` giving `totalDistance` a value of 4. The alert is called again.

##What is a closure?

Defining what a closure is can be difficult. Here's how [Mozilla](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures) defines them:

**Closures are functions that refer to independent (free) variables. In other words, the function defined in the closure 'remembers' the environment in which it was created.**

The way I see it, three things are needed for a closure:

	1) A containing function.
	2) An environment (read: variables) within #1.
	3) A function returned by #1 that knows about #2.

Since Mozilla refers to the containing function as the closure, I would say that the product of a closure is a function that has access to an environment from a function that is now terminated.

##A practical application for closures - information hiding

I'd like to show you how closures are great for hiding information. Look at the following function:

	function greeter(name) {
		var nice = function() {
			alert("Why, hello there " + name + "!");
		};

		var ecstatic = function() {
			alert("OMG " + capitalize() + " IS HERE!");
		};

		var capitalize = function() {
			return name.toUpperCase();	
		};

		return {
			nice: nice,
			ecstatic: ecstatic
		};
	}

I've created a greeter module that has a few functions for performing different types of greetings. Here is an example of it in use:

	var jarvis = greeter("Chris");

	jarvis.nice(); //Why, hello there Chris!
	jarvis.ecstatic(); //OMG CHRIS IS HERE!

Here's the cool thing. I'll try and call `capitalize`, also a function defined in `greeter`:

	jarvis.capitalize(); //TypeError: jarvis.capitalize is not a known function

You can return JavaScript objects that hold multiple functions that reference the same closure. `nice` and `ecstatic` can access `capitalize` because THEY know about it, but we cannot access it from the outside. This makes closures great for information hiding. 

##Conclusion

As I said before, closures appear to be a difficult concept to grasp, but that is just a deception. When you know about a few prerequisite concepts and then are shown some examples, grasping closures becomes much easier.

I have included references to other resources that aided me in learning about closures. Feel free to check them out below.

##Resources

[Stack Overflow](http://stackoverflow.com/questions/111102/how-do-javascript-closures-work)

[JavaScript, JavaScript...](https://javascriptweblog.wordpress.com/2010/10/25/understanding-javascript-closures/)

[What is Lexical Scope?](http://stackoverflow.com/questions/1047454/what-is-lexical-scope)

[JavaScript Scope - Lexical Scoping, Closures, & Controlling Context](http://spin.atomicobject.com/2014/10/20/javascript-scope-closures/)

[Lexical scope vs dynamic scope (Wikipedia)](https://en.wikipedia.org/wiki/Scope_%28computer_science%29#Lexical_scope_vs._dynamic_scope)

[Function scope (Wikipedia)](https://en.wikipedia.org/wiki/Scope_%28computer_science%29#Function_scope).

[Closures - Mozilla](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures)
