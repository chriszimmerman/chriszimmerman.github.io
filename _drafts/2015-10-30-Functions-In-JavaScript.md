---
layout: post
title: Functions In JavaScript
comments: true
tags:
- javascript
---

#Functions In Javascript 

At my job, I usually work on our C# backend, but I occasionally get to do some work in JavaScript. Not having nearly as much JavaScript experience as C# experience, I encounter things I don't quite understand.

One such thing is the number of ways in which a function can be declared. Here are several examples of ways I see functions written in JavaScript:

\#1)

	function isOdd(number) {
		return number % 2 == 1;
	}

\#2)

	var isOdd = function(number) {
		return number % 2 == 1;
	};

\#3)

	var isOdd = function isOdd(number) {
		return number % 2 == 1;
	};

What's going on here? I'll explain. But first, I'd like to talk about a few different features of JavaScript that will aid in understanding the differences.

##First class functions

In JavaScript, functions are first-class citizens. This means that they can be assigned to values and passed around as values to other functions. This is pretty nifty. This is the reason why you're even able to define a function like how the functions in examples #2 and #3 are defined. This concept is pretty standard in a lot of functional languages like Clojure, Haskell, and Elixir.

## Function declarations vs function expressions

When you define a function in the manner done in example #1, you are giving the function a name. This is an example of a *function declaration.* The function is defined at parse time, which means that the function is available within all of the scope it's declared in. This way of defining a function also gives the function a meaningful name in the call stack when trying to debug JavaScript code. 

Examples #2 and #3 are examples of *function expressions*. This means that the function is defined within an expression, usually a variable assignment expression. This results in the function being defined at run time. With function expressions, the function name is optional. However, if a name is not given to a function in a function expression, it will have no name in the stacktrace, which makes debugging difficult. Example #3 is an example of a *named function expression*. Due to variable hoisting in JavaScript, this way of defining functions can potentially lead to a bad situation.

##Hoisting

In JavaScript, variables are hoisted. This means that a variable can be declared anywhere within a given scope, but programs will execute as if the variable was declared right away at the top of the scope. In another language, such as C#, hoisting doesn't exist, so the following code would be invalid:

	x = 7 + 3;
	int x;

The C# compiler would inform you that there is an error with this code: x does not exist at the point of assigning it 7 + 3. However, a JavaScript analog such as the following code would be acceptable:

	x = 7 + 3;
	var x;

In JavaScript, the variable `x` would be assigned the value 10 and everything would be fine and dandy. The idiom in JavaScript is to declare all variables intended to be used within a given scope at the top of the scope. Coming from languages without hoisting and having a habit of declaring variables as close as I can to where they are used for the first time, I find this strange. But I get the idea of letting people know what they're going to encounter in a function.

Going back to our examples above, here is a contrived instance where assigning the function to a variable would result in an error:

	function example(){
		return isOdd(7);

		var isOdd = function(number) {
			return number % 2 == 1;
		};
	}

When I paste this in my browser console, I get the following error:

	TypeError: isOdd is not a function

However, this will execute without error, returning true.

	function example(){
		return isOdd(7);

		function isOdd(number) {
			return number % 2 == 1;
		}
	}

##Conclusion

I don't consider myself educated or experienced enough in JavaScript to say which of these methods is best for defining functions. At the very least, I would say using names with function expressions would be much better than not using names. That leaves the choice between function declarations and named function expressions.

Feel free to leave a commment if you have an opinion on where one way would be used over another.

##Resources

[Stack Overflow](http://stackoverflow.com/questions/336859/var-functionname-function-vs-function-functionname)

[More Stack Overflow](http://programmers.stackexchange.com/questions/160732/function-declaration-as-var-instead-of-function)

[Wikipedia - First Class Functions](https://en.wikipedia.org/wiki/First-class_function)

[var statements](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/var)

[Named function expressions demystified](http://kangax.github.io/nfe/)
