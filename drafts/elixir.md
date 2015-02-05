---
layout: post
title: Elixir Sampler Flight
---

Elixir Sampler Flight
=====================

Over the past few months, I've been messing around with the Elixir programming language. As far as functional languages go, I have yet to find one that I can stick to. Elixir has been my latest FP adventure. 

# Introduction

Elixir is a functional programming language created by Jose Valim in 2012. Elixir runs on the Erlang Virtual Machine, BEAM. This allows Elixir to take advantage of Erlang's awesome concurrency capabilities. 

# Language goals
When Jose started creating Elixir, he had three goals in mind: compatibility, productivity, and extensibility.

### Compatibility
In order to take advantage of Erlang's features such as its concurrency model and libraries, Elixir strives to stay compatible with the underlying Erlang VM. This allows Elixir code to compile to Erlang byte code without a performance degredation. 

### Productivity

The core of the Elixir language is very small. This allows a lot of the language to be written in itself, making it a homoiconic language. Many of the language's constructs have been written using macros. This allows developers to easily extend the language using their own macros for their own purposes, making it easy to build things like DSLs.

Elixir's syntax is a combination of Ruby and Erlang. This makes sense since Jose was on the core Rails team. Some people say that Elixir improves upon Erlang's "weird" syntax. I have virtually no experience in writing Erlang code, so I don't have an informed opinion on that. The syntax reminds me a lot of Ruby. I personally find Ruby very enjoyable to program in. I get things done in Ruby. So this is a plus for me. 

### Extensibility

In my opinion, the extensibility and productivity goals go hand-in-hand. The core Elixir language is very small. This makes it easy to extend the language for specific needs, which lends to getting things done.   

# Obtaining Elixir

If you want to mess around with some of the code examples you'll see in a bit, you can grab the latest release of Elixir from [elixir-lang.org](http://elixir-lang.org/). You can probably also get it from the package manager of your choice. 

# iex - Interactive Elixir

iex (or Interactive Elixir) is Elixir's repl. If you have Elixir installed, you can start iex by typing the command `iex`

iex has many useful helper functions. The most useful one is probably the help function `h` which will give you a list of iex functions along with a description of what they do. You can also pass module names and their functions to see their documentation. For example, `h Enum.map` gets you the following output:

                            def map(collection, fun)

	Returns a new collection, where each item is the result of invoking fun on each
	corresponding item of collection.

	For dicts, the function expects a key-value tuple.

	Examples

	┃ iex> Enum.map([1, 2, 3], fn(x) -> x * 2 end)
	┃ [2, 4, 6]
	┃
	┃ iex> Enum.map([a: 1, b: 2], fn({k, v}) -> {k, -v} end)
	┃ [a: -1, b: -2]

Another commonly used helper function is for compiling files: `c`. You can pass in the name of an elixir script file (.ex or .exs) that you want to compile into BEAM bytecode: `c "primes.ex"` 

# Let's take a look at some code

Elixir has variables

	age = 25

	name = "Anthony Bourdain"

	isChef = true

One thing that's different about Elixir from most langauges is that the = operator is NOT the assignment operator. It's a match operator. Elixir makes use of pattern matching. Pattern matching is used in things such as conditional clauses and extracting values from complex data types. Here is an example of a case clause.

	defmodule Coolness do
		def coolness name do
			case name do
				"Chris" -> "You're pretty cool!"
				"Nick" -> "You're okay"
				"Dan" -> "Who is Dan?"
				_ -> "You be lame"
			end
		end
	end

An aside: one little weird thing about Elixir is that if you have named functions that aren't lambdas, they must be contained within a module. Here I have a module named Coolness that contains the function coolness. 

	iex(1)> Coolness.coolness "Dan"
	"Who is Dan?"

Pattern matching can also be used to extract values from data structures such as tuples. I can use variables on the left side of the match operator to grab values from something on the right side.

	iex(1)> [1, x, 3] = [1, 2, 3]
	[1, 2, 3]
	iex(2)>x
	2

In Elixir, functions can be assigned to variables. These are known as lambdas. Lambdas are invoked by placing the . operator after the lambda name and before the parentheses.

	square = fn number -> number * number end

	add = fn number1, number2 -> number1 + number2 end

	IO.puts square.(3)	# 9

	IO.puts add.(8,9)	# 17

	# Named functions for comparison.
	# Comment lines in Elixir start with a hashtag like in Ruby.
	defmodule MyMath do
		def square number do
			number * number
		end

		def add number1, number2 do
			number1 + number2
		end
	end

# Macros

Elixir has support for macros. With a small core language, it's very easy to extend the language for one's own specific purposes via macros. One benefit of macros is that it's easy to create a custom domain specific language. 

The following example is the hello world of macros, as well as the extent of my knowledge of writing macros: unless. In ruby, there is a keyword, `unless` that allows one to write conditionals that will execute if the statement in the `unless` clause is not true. Basically, think of it as an 'if not' statement.

	defmodule MacroExample do
		defmacro unless(condition, clauses) do
			do_this_if_false = Keyword.get(clauses, :do, nil)
			do_this_if_true = Keyword.get(clauses, :else, nil)

			quote do
				case unquote condition do
					expression when expression in [false, nil] -> unquote do_this_if_false
					_																					 -> unquote do_this_if_true
				end
			end
		end
	end

What's going on here? The `do_this_if_false` and `do_this_if_true` variables grab the code that should be executed for each respective clause. Here's where things get weird for those not familiar with macros. 

The `quote` function takes a block of code and stores it as its internal representation in Elixir, a nested tuple, without evaluating it. `unquote` is a function that will evaluate the code passed into it. In this example, that's the condition that's evaluated to determine which clause to execute. Since `false` and `nil` are 'falsy' values in Elixir, if the condition evaluates to either, the code in the `do_this_if_false` variable gets executed and returned. Otherwise, the code in the `do_this_if_true` variable gets executed and returned. 

	iex(1)> require MacroExample
	nil
	iex(2)> MacroExample.unless 5 != 3 do
	...(2)> IO.puts "5 == 3"
	...(2)> else
	...(2)> IO.puts "5 != 3"
	...(2)> end
	{% raw %}{{:., [line: 3], [{:__aliases__, [counter: 0, line: 3], [:IO]}, :puts]}, [line: 3], ["5 == 3"]} {% endraw %}
	5 != 3
	:ok
	
# Processes/concurrency/multithreading

# Testing framework - ExUnit

# Mix

# References

[Elixir-lang.org](http://elixir-lang.org)

[Elixir Wikipedia article](http://en.wikipedia.org/wiki/Elixir_%28programming_language%29)

[Wikipedia entry on concurrency](http://en.wikipedia.org/wiki/Erlang_%28programming_language%29#Concurrency_and_distribution_orientation)

[Elixir language design goals](http://elixir-lang.org/blog/2013/08/08/elixir-design-goals/)
