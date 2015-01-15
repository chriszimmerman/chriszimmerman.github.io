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

## Compatibility
In order to take advantage of Erlang's features such as its concurrency model and libraries, Elixir strives to stay compatible with the underlying Erlang VM. This allows Elixir code to compile to Erlang byte code without a performance degredation. 

## Productivity

The core of the Elixir language is very small. This allows a lot of the language to be written in itself, making it a homoiconic language. Many of the language's constructs have been written using macros. This allows developers to easily extend the language using their own macros for their own purposes, making it easy to build things like DSLs.

Elixir's syntax is a combination of Ruby and Erlang. This makes sense since Jose was on the core Rails team. Some people say that Elixir improves upon Erlang's "weird" syntax. I have virtually no experience in writing Erlang code, so I don't have an informed opinion on that. The syntax reminds me a lot of Ruby. I personally find Ruby very enjoyable to program in. I get things done in Ruby. So this is a plus for me. 

## Extensibility

In my opinion, the extensibility and productivity goals go hand-in-hand. The core Elixir language is very small. This makes it easy to extend the language for specific needs, which lends to getting things done.   

Let's take a look at some code!

	# Comment lines in Elixir start with a hashtag like in Ruby
	defmodule MyMath do
		def square number do
			number * number
		end

		def add number1, number2 do
			number1 + number2
		end
	end

One little weird thing about Elixir is that if you have named functions that aren't lambdas, they must be contained within a module. Here I have a module named MyMath that contains two functions: square and add.

Language background
Language features
Processes/concurrency/multithreading
Macros
Testing framework - ExUnit
Mix

http://en.wikipedia.org/wiki/Elixir_%28programming_language%29
http://en.wikipedia.org/wiki/Erlang_%28programming_language%29#Concurrency_and_distribution_orientation
elixir-lang.org/blog/2013/08/08/elixir-design-goals/
http://en.wikipedia.org/wiki/Homoiconicity
