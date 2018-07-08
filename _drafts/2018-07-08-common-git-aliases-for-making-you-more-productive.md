---
layout: post
title: Common Git Aliases for Making You More Productive
comments: true
tags:
- git
- productivity
---

As of late, I've been more mindful to identify areas in my workflow that I can make more efficient. If you find yourself doing repetitive tasks or tasks that take a long time, you should consider if there are ways to automate those tasks or make them take less time to complete.

One wasteful area I identified recently is the git commands I use. I found myself typing commands like  `git status`, `git checkout` or `git checkout -b` a lot. It might not seem like much, but those keystrokes add up over time, especially if lots of other developers are doing the same thing. I was aware of git aliases, so I created a few (and borrowed others from coworkers) to make myself more efficient.

## Git aliases

Aliases allow you to assign a particular git command, or series of commands, to a single command that you give a name to. Here are the aliases I use:

### Checking your status

The `git status` command lets you know where you are in the context of git.

Some colleagues of mine have turned me onto using the alias `git st`.

### Doing a checkout

The `git checkout` command does a few things, which I'm not a big fan of, since it's not intuitive to folks who are new to git. You can check out an existing branch, go to a particular commit, or revert changes that are not staged for commit.

I use the alias `git cout` to save some characters.

### Creating a new branch

When you supply the `-b` flag to the `git checkout` command, it creates a new branch and switches you to it (e.g. `git checkout -b my-new-feature`). This is the 4th thing I know that `git checkout` does.

I use the alias `git coutb` to shorten this command (e.g. `git coutb my-new-feature`).

### Amending a commit

Sometimes after making a commit, I find that there's a file I meant to commit, but didn't do so because I forgot to stage it. I stage the file and amend the commit with `git commit --amend`.

I created an alias called `git amend` that does a slight modification of the `git commit --amend` command: `git commit -a --amend`. This will stage all unstaged files and amend them to the latest commit.

### Deleting a branch

The command to delete a branch in git is NOT straightforward at all. It is `git branch -D` (e.g. `git branch -D branch-to-delete`). I have to think about this sometimes and don't always remember it.

I created a straightforward alias for this command: `git delete` (e.g. `git delete branch-to-delete`).

### Fetching and pulling the current branch

I frequently pull my workplace's develop branch. I also like to have any new remote branches that have been pushed so I have an idea of that's going on. I used to do this in two seprate commands: `git fetch` and `git pull`.

I created an alias, `git fpull`, which does both the fetch and the pull. It aliases the two commands being passed to the command line: `!git fetch && git pull`.

## Adding these aliases for your own use

You can run the following commands to add these aliases to your global git config:

```bash
git config --global alias.st 'status'
git config --global alias.cout 'checkout'
git config --global alias.coutb 'checkout -b'
git config --global alias.amend 'commit -a --amend'
git config --global alias.delete 'branch -D'
git config --global alias.fpull '!git fetch && git pull'
```

Alternatively, you can go to a git repo I created and run a bash script that will add these aliases for you. The repo can be found [on my GitHub](https://github.com/chriszimmerman/git-aliases).

## Conclusion

I hope you find these git aliases helpful in making you more productive. If you have any git aliases you'd like to share, feel free to leave a comment.