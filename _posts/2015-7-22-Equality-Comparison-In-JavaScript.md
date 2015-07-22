---
layout: post
title: Equality Comparison In JavaScript
comments: true
tags:
- javascript
---

#Equality Comparison In JavaScript

Let's talk about something not fun: equality comparison in JavaScript. In most languages, operators for checking equality and inequality between two values exist. They usually are == and !=, respectively. JavaScript has these operators as well, but they come with a not fun surprise. In addition to performing comparison, these operators perform type coercion in order to match the types if they are different. The tricky thing is that sometimes JavaScript coerces types to values that you wouldn't expect. 

##Truthy and Falsy Values

When comparing two different values that are of different types, JavaScript will coerce these values into booleans when == and != are used. What makes this weird is that values in JavaScript can be 'truthy' or 'falsy'. For example, if you opened up a console in your browser and typed the following statement:

	0 == false;

You would get `true` as a result. In JavaScript, the number 0 is a falsy value. Falsy values evaluate to false when treated as boolean values. After the type coercion, we have the following statement:

	false == false;

which is a true statement.

In JavaScript, the following values are falsy:

	0
	'' and "" (the empty string)
	null
	undefined
	false
	NaN (not a number)

Truthy values evaluate to true when coerced into booleans. Examples of truthy values are:

	3
	"Borat"
	true
	{ location: "Minnesota", population: 12000000 }

##Just Use === and !==

I probably should have said this right off the bat:

**Don't ever use the == and != operators when writing JavaScript code.**

No good will come of this. Whenever encountering code that uses these operators, unnecessary mental energy must be expended thinking about the possibility of the gotchas that these operators bring. Instead, just use these operators:

	===

and

	!==

These are known as the strict equality and strict inequality operators, respectively. They behave like how == and != operators work in most other languages. Unlike == and !=, if two values of different types are being compared, no type coercion will occur and the expression will evaluate to false.  

##Conclusion

In JavaScript, use === and !== for comparision. Your brain (and other brains!) will thank you.

## References

[StackOverflow](http://stackoverflow.com/questions/359494/does-it-matter-which-equals-operator-vs-i-use-in-javascript-comparisons)

[Comparison Operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Comparison_Operators)

[Comparison and Sameness](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Equality_comparisons_and_sameness)
