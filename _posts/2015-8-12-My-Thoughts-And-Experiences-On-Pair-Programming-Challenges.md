---
layout: post
title: My Thoughts and Experiences on Pair Programming - Challenges 
comments: true
tags:
- pair programming
- methodology
---

#My Thoughts and Experiences on Pair Programming: Part 3

This is the final post in a three part series. In [part 1](../10/My-Thoughts-And-Experiences-On-Pair-Programming-Intro.html) of this series, I gave an introduction to pair programming. In [part 2](../11/My-Thoughts-And-Experiences-On-Pair-Programming-Benefits.html), I discussed the benefits of pair programming. I will now talk about the challenges of pair programming.

##Challenges

Pairing isn't a silver bullet. Like anything, there are drawbacks that come with the advantages. There are also times when it's better to not pair on work.

###Tasks not meant for a pair

Are you making trivial changes to a configuration file? Are you tweaking the position of a UI control on a web page?  Are you doing a boring, repetitive task? If you said yes to any of these, you probably don't need another person with you on these tasks. Some tasks are awful enough with just one person doing them and there is no benefit to subjecting another developer to the work. In fact, that other developer's time is most likely better spent working on something else.

At my old job, I worked on a WinForms app. Occasionally, we'd have to make changes to the UI. This involved using a designer in Visual Studio that didn't \*quite\* show what would actually appear in the app, so we'd have to make our changes in the designer, compile, fire up the app, and go to the view to make sure the changes appeared how we intended them to appear. The cycle of tweak/compile/fire-up-app/go-to-view was several minutes. It was brutal. I paired on that task with somebody. It was totally unnecessary to have two people working on that task.

###Staying engaged

It's important that both people stay engaged on the task. Sometimes, a pair might have one person who has a more assertive personality and ends up hogging the keyboard, leaving the other person bored. Try to share duties. Practicing [Test-Driven Development](https://en.wikipedia.org/wiki/Test-driven_development) and [ping-pong pairing](http://c2.com/cgi/wiki?PairProgrammingPingPongPattern) help alleviate this issue. Each member of the pair doesn't go too long without doing work.

If your pair looks bored, you can try asking an innocuous question without sounding accusatory like, "What do you think if we do X here?" That will usually get the other person back into the work.

###Friction

Sometimes you get stuck working with people you may disagree with professionally. Or even with people who are complete jerks. It happens. The best way to deal with this problem, in my experience, is to avoid it. Work with people who share your values. Work with people you enjoy working with.

Ask your manager to switch you to a team of people you want to work with. It might not always be able to happen, but you can still ask. Switch to another team at another company, if necessary. It sounds a little childish, but the friction of working directly with somebody who stresses you out all day can take its toll. And you don't have to deal with it.

If you can't avoid working with them, try to communicate your issues with the person in a constructive way. Retrospectives are a good venue for this. Talking to the person one-on-one works as well.

There was a point in time where I dreaded every third day of work (assuming the pairing rotation remained constant) because it meant pairing with someone who didn't share my code quality values. There was arguing about the worth of tests, whether or not to refactor code, whether or not to "just put this one quick hack in", and a number of related topics. This took away from enjoyment of my job. Fortunately, the problem solved itself and the person moved to another team. My day-to-day became much better.

###Imposter syndrome, ho!

When you're working next to a person all day for 8 hours a day, they will see you make mistakes. This constant visibility into how you perform as a programmer can be stressful, especially if you're somebody like me with imposter syndrome. My way of dealing with this is reminding myself that I'm a human being that makes mistakes. As long as I'm giving my best, that's all that anyone can ask for.

###It's exhausting

It's hard to be on mentally all the time. Many people I know, myself included, have attested to being totally exhausted at the end of the day when we first started pairing. It takes a lot more to be involved all day with your pair, but I feel way more productive when with a pair than when not. Make sure to take breaks regularly. Get water and snacks. Go to the bathroom. Get up and stretch. Being on for extended periods of time can be unhealthy, so make sure you take breaks.

###It's not for everybody

Some people have certain personality types that prevent them from being effective in a pairing environment. This does not make them a bad developer; they just operate more efficiently in a different setting. Some people need to be in their own zone to be effective at what they do.

##Conclusion

For me personally, I find pairing beneficial mostly because I feel challenged when with another developer. I can't be lazy. I can't be on autopilot. I'm kept honest. I feel that this keeps me at the top of my game. I also get opportunities to share my knowledge with other developers. This results in a better team, a better community of developers.

Hopefully, my experiences have given you some insight into pair programming. If you want to read about some of my colleagues' thoughts on pair programming, you can check out [Anthony Sciamanna's post on Ping Pong Pair Programming](http://anthonysciamanna.com/2015/04/18/ping-pong-pair-programming.html) and [Dan Donahue's series of pair programming posts](http://dandonahue.net/2013/11/20/my-thoughts-on-pair-programming-intro.html).

If you would like to get started with pair programming, check out Avdi Grimm's site [Pairprogramwith.me](http://www.pairprogramwith.me/).
