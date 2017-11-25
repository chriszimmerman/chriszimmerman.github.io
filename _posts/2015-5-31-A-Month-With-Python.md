---
layout: post
title: A Month With Python 
comments: true
tags:
- Python 
- Languages 
---

Recently, I attended an exceptional philly.rb meetup where two talks were presented. One was on [civic hacking](http://www.slideshare.net/WilliamJeffries1/civic-hacking-on-rails) and one was on [language exploration](http://lanyrd.com/2015/mwrc/sdkmkc/#link-cbfhz). The talk on language exploration, titled "Make up your own 'Hello, world!'", inspired me to take a short-to-medium-term look into a new language.

In Justin Campbell's talk, he discusses the importance and benefits of learning new languages. Here's the gist: take up a new language and implement a nontrivial-yet-not-crazily-complex project. Try to embrace the idioms of the language while implementing your project so that you expand your mind, gain new perspective, and bring what you've learned back into the languages you currently work in. Justin's 'Hello world' of choice is a URL shortener. It's a nontrivial project and ensures that you'll be using a not insignificant portion of the language's features in order to implement it.

I decided to try this idea and timebox learning a new language to a month. The language I chose: Python. My version of 'Hello, world!': a [sudoku](http://en.wikipedia.org/wiki/Sudoku) solver. With a sudoku solver, you can learn how to get user input in several ways: from a file, from them typing it in by hand, from a web form. Once you get the input, you need to parse and validate the puzzle to see if it's already invalid. If not, you can attempt to solve it. As far as solving goes, I kept my solver simple and used a brute force algorithm to solve the puzzle. 

## Motivation

I regard Python and Ruby as the Pepsi and Coke of dynamically typed languages. They're pretty similar, or so I've heard. Before taking this journey, I only knew Ruby. I have used Ruby mostly as a scripting language to help automate tasks at my previous job. Other than that, I like to work on small side projects in Ruby. I find Ruby very enjoyable to work in. 

However, I wanted to make sure I wasn't missing out on anything. I heard that Python had fantastic libraries like SciPy and NumPy for support in science and math-related tasks. After attending this talk, I saw this as a great opportunity to get a taste for a language without heavily investing in it.

## Project(s)

For my first week or so with Python, I went through a good deal of [Automating the Boring Stuff With Python](https://automatetheboringstuff.com/) by Al Sweigart. Because of my Ruby background, I didn't find much in Python too unfamiliar. Going through this book got my head around fundamentals of Python like how to name variables/classes/methods and basic syntax. 

After getting my feet wet, I moved on to writing a sudoku solver that is (mostly) unit tested and is capable of solving 9 by 9 sudoku puzzles. In doing this, I gained some experience with using Python's unittest library. Here is an example of a unit test written in Python:

	class SudokuPuzzleSolverTest(unittest.TestCase):

		def test_is_valid(self):
			puzzle = [
				[
					Square(1,1,1,1),
					Square(4,1,2,1),
					Square(3,1,3,2),
					Square(2,1,4,2)
				],
				[
					Square(3,2,1,1),
					Square(2,2,2,1),
					Square(4,2,3,2),
					Square(1,2,4,2)
				],
				[
					Square(4,3,1,3),
					Square(1,3,2,3),
					Square(2,3,3,4),
					Square(3,3,4,4)
				],
				[
					Square(2,4,1,3),
					Square(3,4,2,3),
					Square(1,4,3,4),
					Square(4,4,4,4)
				]
			]
	solver = Solver()
	self.assertTrue(solver.is_valid(puzzle))

In my project, I represent a sudoku puzzle as a list of lists of `Square` objects. Here is my Square class:

	class Square(object):
		def __init__(self, number, row, column, block):
			self.number = number
			self.row = row 
			self.column = column 
			self.block = block

		def __eq__(self, other):
			return (isinstance(other, self.__class__)
					and self.__dict__ == other.__dict__)

		def __hash__(self):
			return int(str(self.number) + str(self.row) + str(self.column) + str(self.block))

My solution has two objects: a `FileReader` and a `Solver`. The responsibility of the `FileReader` object is to read the contents of a file and convert it into my representation of a sudoku puzzle. An example file looks like this:

	_ 4 3 9 _ _ 2 _ 5
	8 _ 5 _ 7 _ 6 _ _
	6 _ _ 5 _ _ 3 _ 9
	_ _ 2 _ 8 _ _ _ _
	_ 3 _ 2 5 4 _ 1 _
	_ _ _ _ 1 _ 9 _ _
	2 _ 9 _ _ 5 _ _ 8
	_ _ 4 _ 2 _ 5 _ 7
	1 _ 6 _ _ 7 4 2 _

One method reads the file, getting a list of strings as output. Another method sanitizes that list of strings, extracts the numbers (or blanks) and converts them into sudoku `Square` objects. 

The responsibility of the `Solver` class is to take that list of lists and 1) make sure that the puzzle is even solvable with the squares that are already filled in and 2) to find the solution if one can be found. As said before, I use a [brute force algorithm](http://en.wikipedia.org/wiki/Sudoku_solving_algorithms#Backtracking) to solve the puzzle. Once the puzzle is solved, the solution is printed.

## Impressions of Python

As I expected, I found Python very similar to Ruby. I didn't discover anything mind-blowing like I most likely would have if I had tried something unfamiliar, like ELM, Swift, or Haskell. I found this to be a bummer, as one of the potential benefits of learning a new programming language is having your brain expanded in different ways.

I like Python. But I like Ruby better. Mostly due to personal preferences, I suppose. Ruby actually has private methods. Python has no concept of privateness. I like chaining methods. I prefer `"kitties".upcase.reverse.length` over `len("kitties".upper()[::-1])`. If I had a job where I wrote in Python, I wouldn't be upset. But Ruby would be a much more preferable alternative. 

## Conclusion

I'm glad that I did this exercise, even if I found out that Python isn't a language that I would like to pursue further at this time. Justin has a really great way for looking into new programming languages and I'm glad that I tried his idea. I highly recommend taking a similar approach for learning a new programming language.

You can find the source code for my solver [here](https://github.com/chriszimmerman/python_month/tree/master/sudoku).

## References
[Make Up Your Own 'Hello, World!'](http://lanyrd.com/2015/mwrc/sdkmkc/#link-cbfhz)

[Automating the Boring Stuff With Python](https://automatetheboringstuff.com/)
