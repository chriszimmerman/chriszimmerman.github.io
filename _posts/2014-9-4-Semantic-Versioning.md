---
layout: post
title: Semantic Versioning
---

# Semantic Versioning

At work, the topic of semantic versioning came up. I decided to do some research on the topic since I had not heard of the term before. 

## What is semantic versioning?

Semantic versioning is a convention for version-naming for your products, whether they be libraries, APIs, etc. Its purpose is to prevent difficulties in releasing new versions of your product. It may be difficult to release a new version of your product if you have to wait for new versions of your product's dependencies to be released. You may also be reluctant to adopt new versions of packages or libraries since you might not know if a new version will break your existing code. 

In short:

**Semantic versioning allows developers to easily reason about when it is and isn't appropriate to adopt a new version of a dependency.**

## Format

For semantic versioning, your product must define a public API. The basic format for your API's version should be as follows:

	major.minor.patch

For example, let's say there is a library called Yarner, a string manipulation library. Its current version is 2.3.5. This means that the major version is 2, the minor version is 3, and the patch version is 5.

The significance of the numbers is as follows:  

	-major - incremented when API-breaking changes are made.
			Minor and patch numbers are reset to zero.
	-minor - incremented when non-API-breaking changes are made.
			Patch number is reset to zero.
	-patch - incrmented when non-API-breaking bug fixes are made.

## Example

I have a library called AreaCalculator which has a public method, CalculateRectangleArea. It is currently version 1.2.0. It has the following signature: 

	CalculateRectangleArea(int length, int width).  

For whatever dumb reason, CalculateRectangleArea was calculating the area by multiplying length by itself:

	return length * length;
 
This was fixed and now it properly calculates the area by returning length * width.

Fixing this bug doesn't break the interface of CalculateRectangleArea and it's not a new feature, so the release containing this fix can be versioned as 1.2.1.

## Another example

For my social website Stalk.me, I have provided an API v1.3.2 with which clients can find Users via the public FindPeopleNearby method. FindPeopleNearby takes a FindUserRequest object as its parameter. It has two fields, City and RangeInMiles.

	//v1.3.2
	public class FindUserRequest {
		public string City { get; set; }
		public int RangeInMiles { get; set; }
	}

During development, I decided to utilize state in addition to city for location since towns with the same name can be in different states. I have added a new field, State, that clients can put on their request. This doesn't break any functionality, so I can increase the minor version, which results in the patch version resetting to zero.

	//v1.4.0
	public class FindUserRequest {
		public string City { get; set; }
		public string State { get; set; }
		public int RangeInMiles { get; set; }
	}

During the next release, I realized there was a much better way to find out where a user was located: the zip code! Instead of using city and state, using the zip code is a much more efficient way of determining someone's location. However, clients may be depending on City and State existing to find location in their clients. I'm going to be a jerk and change the contract deleting City and State. In doing this change, I break the current version, 1.4.0. I must increment the major version and reset the minor and patch versions to zero. This results in a new FindUserReuqest:  

	//v2.0.0
	public class FindUserRequest {
		public string ZipCode {get; set;}
		public int RangeInMiles {get; set;}
	}

## Conclusion

I hope these examples have illustrated how semantic versioning works and why you would want to adhere to it. The following link is how I learned about semantic versioning and is essentially what I have discussed in this blog, plus more:

[Semantic Versioning](http://semver.org)

Thanks for reading!
