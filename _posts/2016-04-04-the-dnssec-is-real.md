---
layout:   post
title:    "The DNSSEC is real"
date:     2016-04-04 12:00:00
category: info
---
As of today (2016-04-04) my domain finally supports DNSSEC. It was much simpler
than I thought it would be. It seems namecheap now officially allows you to
publish DS records in the parent zone of your domain (limited only to TLDs
which support it). This is one of the last things that I wanted to set up on my
server.

In the end, the process was made very simple by the existence of
[this][cheatsheet] which details exactly how to set up DNSSEC on BIND 9.10 or
higher.

Currently the KSK is SHARSA256 1024 bits and the ZSK is SHARSA256 2048 bits, I
am considering moving to using a 2048 bit KSK but I'm not sure if there will be
much of a benefit.  I am using NSEC3 with a SHA-1 hash with the opt-out bit
unset and 100 iterations.

In any case, you can now rest assured that if your resolver uses DNSSEC
(Google's resolvers will return a failure in case they find a DS record but the
DNSSEC validation fails) you will be receiving signed and verifiable data.  Of
course, I doubt anyone but me really cares :P.

[cheatsheet]: https://kb.isc.org/getAttach/122/AA-01311/DNSSEC-QR-B4.pdf
