---
layout: post
title: Processes In Elixir
---

Processes In Elixir
===================

Elixir makes use to the Erlang VM to create and manage many processes. Concurrency is easy and inexpensive in Elixir.

You can make a new process in Elixir by using the spawn function:

	spawn(module, :function_name, [optional_arguments])

The spawn function takes a module and a function from said module, as well as a list of optional arguments to pass to the function. Spawn returns a process identifier, or pid. A pid consists of three numbers which are used to identify a process. If you type `self` into iex, you'll find that iex itself runs as an elixir process.

	iex(1)> self
	#PID<0.53.0>

Processes need a way to communicate with each other in order to do anything meaningful. In Elixir, processes achieve this with messages. Processes send messages with data to other processes that receive those messages and handle the data accordingly. 

Here is a simple example:

proctut.exs

	defmodule ProcessMessage do
		def send_message msg do
			destination_pid = spawn(ProcessMessage, :get_message, [])
			IO.puts "#{inspect(self)} here." 
			IO.puts "Sending message to #{inspect(destination_pid)}"
			send destination_pid, {self, msg}
		end	

		def get_message do
			receive do
				{sender, msg} -> 
					IO.puts "#{inspect(self)} here."
					IO.puts "Received a message from #{inspect(sender)}." 
					IO.puts "It says \"#{msg}\"."
			end
		end
	end

	ProcessMessage.send_message "Why hello there!"

The send_message function takes in a string which will get sent to a process it creates. The created process will run the get_message function, which just waits until it receives a message. It prints the pid of the process that sent the message as well as the message itself. It then terminates.
