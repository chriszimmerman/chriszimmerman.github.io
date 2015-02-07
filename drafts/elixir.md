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

Elixir's syntax is a combination of Ruby and Erlang. This makes sense since Jose was on the core Rails team. Some people say that Elixir improves upon Erlang's "weird" syntax. I have virtually no experience in writing Erlang code, so I don't have an informed opinion on that. Elixir's syntax reminds me a lot of Ruby. I personally find Ruby very enjoyable to program in. I get things done in Ruby. So this is a plus for me. 

### Extensibility

In my opinion, the extensibility and productivity goals go hand-in-hand. The core Elixir language is very small. This makes it easy to extend the language for specific needs, which lends to getting things done.   

# Obtaining Elixir

If you want to mess around with some of the code examples you'll see in a bit, you can grab the latest release of Elixir from [elixir-lang.org](http://elixir-lang.org/). You can probably also get it from the package manager of your choice. 

# iex - Interactive Elixir

iex (or Interactive Elixir) is Elixir's repl. If you have Elixir installed, you can start iex by typing the command `iex`

iex has many useful helper functions. The most useful one is probably the help function `h` which will give you a list of iex functions along with a description of what they do. You can also pass module names and their functions to see their documentation. For example, `h Enum.map` gets you the following output:

{% gist f2a31e4dac4b35773f9b help.txt %}

Another commonly used helper function is for compiling files: `c`. You can pass in the name of an elixir script file (.ex or .exs) that you want to compile into BEAM bytecode: `c "primes.ex"` 

# Let's take a look at some code

Elixir has variables

{% gist f2a31e4dac4b35773f9b variables.exs %}

One thing that's different about Elixir from most langauges is that the = operator is NOT the assignment operator. It's a match operator. Elixir makes use of pattern matching. Pattern matching is used in things such as conditional clauses and extracting values from complex data types. Here is an example of a case clause.

{% gist f2a31e4dac4b35773f9b coolness.exs %}

An aside: one little weird thing about Elixir is that if you have named functions that aren't lambdas, they must be contained within a module. Here I have a module named Coolness that contains the function coolness. 

{% gist f2a31e4dac4b35773f9b coolness_output.txt %}

Pattern matching can also be used to extract values from data structures such as tuples. I can use variables on the left side of the match operator to grab values from something on the right side.

{% gist f2a31e4dac4b35773f9b pattern_matching_destructuring.txt %}

In Elixir, functions can be assigned to variables. These are known as lambdas. Lambdas are invoked by placing the . operator after the lambda name and before the parentheses.

{% gist f2a31e4dac4b35773f9b lambdas_and_functions.exs %}

Elixir and Erlang functions are identified by their arity, that is, the number of parameters the function takes. For example, `MyMath.square` is identified by `MyMath.square/1` and `MyMath.add` is identified by `MyMath.add/2`.

# Macros

Elixir has support for macros. With a small core language, it's very easy to extend the language for one's own specific purposes via macros. One benefit of macros is that it's easy to create a custom domain specific language. 

The following example is the hello world of macros, as well as the extent of my knowledge of writing macros: unless. In ruby, there is a keyword, `unless` that allows one to write conditionals that will execute if the statement in the `unless` clause is not true. Basically, think of it as an 'if not' statement.

{% gist f2a31e4dac4b35773f9b macro_example.exs %}

What's going on here? The `do_this_if_false` and `do_this_if_true` variables hold the code that should be executed for each respective clause. Here's where things get weird for those not familiar with macros. 

The `quote` function takes a block of code and stores it as its internal representation in Elixir, a nested tuple, without evaluating it. `unquote` is a function that will evaluate the code passed into it. In this example, the condition that's evaluated to determine which clause to execute will be passed into `unquote` since that condition actually needs to be evaluated to find out whether it's true or false. Since `false` and `nil` are 'falsy' values in Elixir, if the condition evaluates to either, the code in the `do_this_if_false` variable gets executed and returned. Otherwise, the code in the `do_this_if_true` variable gets executed and returned. 

{% gist f2a31e4dac4b35773f9b macro_output.txt %}

# Concurrency (and why you should care about it)

Why care about concurrency? As computer hardware goes down the route of adding more cores to processors, multicore processing is becoming much more beneficial. Single-threaded programming just ain't gonna cut it anymore.  In the paper [The Free Lunch Is Over](https://www.cs.utexas.edu/~lin/cs380p/Free_Lunch.pdf), this topic is elaborated. In languages like C# and Java, concurrency can be very painful to work with. 

On the other hand, Elixir makes concurrency quite painless. It's very easy to start up multiple processes to do their own work. Elixir takes advantage of Erlang's [actor model](http://en.wikipedia.org/wiki/Actor_model) implementation. In the actor model, each actor (in this case, an actor is an Elixir process) does its own work that only it knows about. Actors communicate with each other via messages.

# Processes

As said before, processes are how Elixir implements concurrency. I wrote [an earlier post on processes](http://blog.chriszimmerman.net/2014/11/02/Elixir-Processes.html) which I'll recap. Each process has its own process ID (or pid) which is used in interprocess communication. A process can reference its own PID with the `self` keyword. The `spawn/1` and `spawn/3` functions are used to create processes that will execute the functions passed into them.  

# Testing framework - ExUnit

# Mix

# References

[Elixir-lang.org](http://elixir-lang.org)

[Elixir Wikipedia article](http://en.wikipedia.org/wiki/Elixir_%28programming_language%29)

[Wikipedia entry on concurrency](http://en.wikipedia.org/wiki/Erlang_%28programming_language%29#Concurrency_and_distribution_orientation)

[Elixir language design goals](http://elixir-lang.org/blog/2013/08/08/elixir-design-goals/)
