---
layout: post
title: Re - The One Benefit of Software Estimation
comments: true
tags:
- agile
- NoEstimates
---

In a [previous blog post of mine](https://blog.chriszimmerman.net/2018/06/27/The-One-Benefit-of-Software-Estimation.html), I discussed the lone merit that software estimation has: making sure folks are on the same page in regard to understanding the complexity and scope of a story.

I was wondering if there was a way to achieve this without estimation. I've got an idea.

## Using T-Shirt Sizing As An Estimation Proxy

T-shirt sizing is a coarser form of estimation. I've seen it used mostly for projects rather than user stories. There are typically four sizes to pick from:

- Small (S)
- Medium (M)
- Large (L)
- Extra Large (XL)

Instead of estimating with points, we can estimate by proxy using T-shirt sizes. This works the same way as estimating with story points, but at the end of it, we can throw the estimate away. We still get the same benefit of having discussions triggered by variance in the team's estimates as we did when doing it with story points.

## Shifting In Complexity Categorization

This will most likely require a shift in thinking about the levels of complexity that each T-shirt size maps to. Whether you do Fibonacci-style estimation or something else, you'll have to re-evaluate your thinking of complexity categories.

### Example

As a member of a team who uses Fibonacci-style estimation, one potential approach is to do a mapping of T-shirt sizes to point ranges, like this:

- Small -> 0.5 - 2 points
- Medium -> 3 - 5 points
- Large -> 8 - 13 points
- Extra Large -> Larger than 13 points

Let's say the team estimates a story with these T-shirt values:

`Small, Medium, Small, Small, Small`

Most of the team agrees that the story is small. There may be a conversation to explain to the team member who estimated `Medium` as to why everyone else thinks the story is a `Small`. This works just like with story point estimation.

As an aside, on my team, if we agree the a story is an 8-point story or a 13-point story, that serves as a trigger to think about if the story can be broken up further, because it usually can. Something similar can happen with T-shirt sizing. Large or extra large stories can be scrutinized to see if they can be broken up into smaller stories.

## Why T-shirt Sizing?

*Why not just estimate how we normally do and then throw the estimation away?*

That's a valid question. I would argue that since there are less values to pick from with T-shirt sizing, there's less probability of squabbling over whether a story is 3 points or 2 points. T-shirt sizing quickly asks, "Are we on the same page?" If so, we can move on with our lives and if not, we can figure it out.

## Conclusion

For reasons mentioned in my other post, I think software estimation is pretty useless. By using T-shirt sizing as an estimation proxy, we can reduce the cruft of estimation and focus on more important things in our work.

Your team can adopt something like a Kanban approach for prioritizing & pulling in work and, if your org is really set on getting estimates from your team, you can just give every story an estimate of 1 point and not even think about it. At that point, your 'velocity' is just how many stories you got done per sprint, regardless of complexity.
