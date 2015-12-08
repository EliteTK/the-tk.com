---
layout:   post
title:    "malloc, realloc and sizeof"
date:     2015-12-02 22:00:00
category: info
---
I spend a lot of time in ##c hoping to provide useful information to people
wishing to learn and understand C and almost every day I see malloc and realloc
code which appears to be straight from a horror movie. I've had to say what I
say in this post repeatedly to many people so I've decided that it's time to
write it once and simply give people a link every time I wish to explain why
such code is incorrect.

The code I'm describing is usually a combination of some or all of this:
{% highlight c %}
struct foo *bar = (struct foo *)malloc(sizeof(struct foo) * 10);

bar = (struct foo *)realloc(bar, sizeof(struct foo) * 20);
{% endhighlight %}
There are multiple issues with this:

 - Casting malloc can hide newbie mistakes such as forgetting to include
   \<stdlib.h\> which can in turn cause strange issues down the line.
 - Casting unnecessarily also gives you rather long lines, especially when you
   have a rather complicated/long type (e.g. const struct foo * const *).
 - You're having to type the same thing three times, when you could type it
   once.
 - If you screw up rewriting the same thing one of three times, you might end
   up allocating the wrong amount of space and still end up with code which
   runs, this can be dangerous down the line if some clever person finds a way
   to exploit this.
 - If you ever want to change the type of bar, you need to change it in 3
   places, if you forget to change it in one of these, you end up with the same
   issue described in the point above.
 - Finally (regarding just the realloc line) if realloc fails, memory is leaked
   since bar's original value is overwritten with NULL, realloc doesn't
   automatically free the original pointer when it can't realloc.

The easy solution is simply:
{% highlight c %}
struct foo *bar = malloc(sizeof *bar * 10), *tmpbar;

tmpbar = realloc(bar, sizeof *bar * 20); /* or sizeof *tmpbar */

if (!tmpbar) {
	free(bar);
	/* error handling */
} else {
	bar = tmpbar;
}
{% endhighlight %}
This solves all of the outlined problems.

-----------------------

Here's the answers to two common questions:

**Q**: _The compiler has always complained (warned) when I tried to assign a
pointer to one type to a pointer to another type. Would this not be the case
here?_

**A**: The C standard states (C11/C99 §6.3.2.3 and C11/C99 §6.5.16.1) roughly
that a pointer to void can be assigned to a pointer to any type, and vice
versa, freely without issuing a warning. This in turn means that the return
value of malloc (and any other function returning void \*) will be converted
without warning to the desired type without needing a cast.

**Q**: _What's the deal with `sizeof *bar`? Also, doesn't the sizeof function
need brackets?_


**A**: The sizeof operator can be given, as an operand, an expressions as well
as the parenthesized name of a type. This means we can do `sizeof *bar`. Also,
since sizeof is an _operator_ and **not** a function, it doesn't require
parentheses when its operand is an expression, the C standard does however
require that for types, the type name has to be parenthesized.  In the end,
it's a style choice whether the parentheses are always there or not, but
personally I think leaving them out is more consistent.
