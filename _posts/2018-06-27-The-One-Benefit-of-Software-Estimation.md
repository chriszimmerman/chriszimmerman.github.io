---
layout: post
title: The One Benefit of Software Estimation
comments: true
tags:
- agile
- estimation
---

Software estimates are mostly a waste of time. Here are some observations I have made in my career that have driven me to this conclusion:

1) Most software development is inherently filled with unknowns and surprise complexity. This uncertainty is difficult to communicate to managers in the form of a single number.
2) Management has a tendency to compare points between teams as a means of performance, despite the number of differences between the teams (size, skillset, and scale of point estimation, to name a few).
3) Sometimes, if a project is big enough, teams are coerced into making estimations for batches of work that will be handed off to other teams. See observation #2 above regarding differences between teams. These differences immediately render the estimates meaningless.

In fact, I can only think of one benefit of estimating that may be its saving grace.

## The One Benefit: Reaching A Common Understanding

There is one benefit that estimation brings. Let me present a scenario to you:

Your team is estimating one of your stories in the backlog. The team reads the story's details and acceptance criteria. After asking questions about the story and getting answers, the team is ready to estimate. Everyone puts their fibonacci-sequence planning poker cards face-down for estimation.  When the product owner says to reveal their estimates, they simultaneously flip their cards. The estimates are revealed:

`2, 3, 8, 5, 5, 13`

These estimates are all over the place. In my experience, when this happens, it means that not everybody is on the same page about the details of a story. If the estimates are closer together or the same, then there is more of a shared understanding of the story amongst the team.

This wide variance in estimates warrants a conversation. Everyone goes around and gives their rationale for their estimation. It's discovered that some of the developers gave a lower esimate because they knew of some existing code in the system that would be able to be reused for this feature. The QA folks didn't know that, and several of them estimated higher because of a bunch of test cases they'll have to test. This was not known to the developers.

After this discussion, the team wants to re-estimate. Once again, they put their planning poker cards face-down. On the product owner's cue, the estimates are once again revealed:

`2, 3, 3, 3, 5, 3`

These estimates are much closer together. The team settles for a 3.

The team collectively has a better understanding of the story because of the conversation, which was triggered by a variance in estimates. Ideally, these conversations would happen before the estimation, but sometimes they don't.

## Conclusion

I'd love for there to be another way to ensure that the team is on the same page without having to estimate and then discover that they're not. I don't have any good ideas on how to achieve this. If you have any ideas, I'd love to hear them.