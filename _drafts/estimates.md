---
layout: post
title: The One Benefit of Software Estimation
comments: true
tags:
- agile
- estimation
---

In my opinion, software estimates are mostly a waste of time. Here are some reasons:

1) Most software development is inherently filled with unknowns and surprise complexity. This usually invalidates the estimate once this complexity is discovered.
2) I've seen management compare points between teams as a means of performance, despite the number of differences between the teams (size, skillset, and scale of point estimation, to name a few).
3) I've even seen teams make estimates on another team's behalf. That's right, a team that wasn't even going to do the work estimated the work for another team!

In fact, I can only think of one benefit of estimating that may be its saving grace.

## The One Benefit: Reaching A Common Understanding

There is one benefit that estimation brings. Let me present a scenario to you:

Your team is estimating one of your stories in the backlog. The team reads the story's details and acceptance criteria . After asking questions about the story and getting answers, the team is ready to estimate. Everyone puts their fibonacci-sequence planning poker cards down for estimation. The estimates are:

`2, 3, 8, 5, 5, 13`

These estimates are all over the place. In my experience, when estimates are all over the place, that means that not everybody is on the same page about what needs to be done for the story. If the estimates are closer together or the same, then there is more of a shared understanding amongst the team.

This wide variance in estimates warrants a conversation. Everyone goes around and gives their rationale for their estimation. It's discovered that some of the developers gave a lower esimate because they knew of some existing code in the system that would be able to be reused for this feature. The QA folks didn't know that, and several of them estimated higher because of a bunch of test cases they'll have to test. This was not known to the developers.

After this discussion, the team wants to re-estimate. The estimates are:

`2, 3, 3, 3, 5, 3`

These estimates are much closer together. The team settles for a 3. The team collectively has a better understanding of the story because of the conversation, which was triggered by a variance in estimates. Ideally, these conversations would happen before the estimation, but sometimes they don't.

## Conclusion

I'd love for there to be another way to ensure that the team is on the same page without having to estimate and then discover that they're not. I don't have any good ideas on how to achieve this. If you have any ideas, I'd love to hear them.