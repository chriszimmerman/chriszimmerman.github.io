---
layout: post
title: Build, Clean, and Rebuild in Visual Studio
comments: true
tags:
- .NET
---

In the .NET environment, the process of compiling source code into output files is called *building*. Two common ways of building are via an IDE, such as the Visual Studio IDE (or the recent Rider IDE from JetBrains), and via the command line using `devenv.exe`.

If you build via an IDE, you'll notice that there are three options under the Build menu: Build, Rebuild, and Clean.

![Visual Studio build options](../../../images/11-25-17/build.png "Visual Studio build options")

They're pretty straightforward, but have some subtle differences between them.

## Build

Build will compile files have changed since the last build. It will only do this for projects that contain files that have changed since the last build. Like I said, pretty straightforward.

## Clean

Clean deletes intermediate and output files (e.g. .exe and .dll files), regardless of whether source code files have changed or not.

## Rebuild

Rebuild is essentially a Clean and then a Build. It deletes existing output files and performs a build, regardless if source code files have changed or not.

There's a subtle difference between Rebuild vs. doing a Clean and then a build. Doing a Clean then a Build cleans all projects at once and then builds all projects at once, whereas doing a Rebuild will clean then build each project *one project at a time*. I can't think of any circumstances off the top of my head where this would be an issue, but it's an interesting note.

## When to do what

In most cases, doing a Build should be sufficient. If you have a solution with a large project that takes a long time to build, you certainly wouldn't want to rebuild it every time if you're not making changes to it. If you're only making changes to smaller projects that build quicker, Build will be smart and only handle those projects.

## Resources

[Building and Cleaning Projects and Solutions in Visual Studio](https://msdn.microsoft.com/en-us/library/5tdasz7h.aspx)

[Devenv.exe (MSDN documentation)](https://msdn.microsoft.com/en-us/library/b20w810z.aspx)

