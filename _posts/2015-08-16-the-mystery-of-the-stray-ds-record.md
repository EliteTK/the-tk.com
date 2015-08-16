---
layout:   post
title:    "The mystery of the stray DS record"
date:     2015-08-16 19:46:00
category: rants
---
So after transferring my domain from transip.eu to namecheap.com for WHOIS
privacy I realised that suddenly the Google public DNS servers were no longer
able to resolve my domain. Very quickly, I realised that quite a few things
seemed to rely on the Google public DNS services (and DNSSEC supporting
resolvers). Fun ensued.

DNSSEC is a fancy extension to DNS which allows resolvers to cryptographically
confirm, through the use of some public keys and signatures, that the records
they are looking up are in fact the records they want and not the result of
some MITM attack. This is explained well in multiple places, so I won't explain
it here.

I transferred my domain from transip.eu who provide DNSSEC (no way to publish
DS records, everything is maintained in the background), but don't provide
WHOIS privacy, to namecheap.com who do provide WHOIS privacy but don't provide
DNSSEC. The DS record that transip.eu published to gtld-servers for their
DNSSEC was left published after I transferred which initially, for someone who
didn't know anything about DNSSEC, caused many confusing side effects.

DS records have to be published in the parent zone, this means that it has to
be done through your registrar. (Unless you have a lot of money and time and
feel like bribing Verisign. If someone knows how to do this without bribery,
tell me!). Upon contacting namecheap about the issue, the person I was talking
to seemed confused about the issue. They seemed to think I was having issues
with A and AAAA records and DNS propagation. They tried to inform me that I
just had to wait. Of course, all the waiting in the world wouldn't get the DS
records to disappear so after explaining the situation a bit better (I still
didn't quite know much about it myself) I got them to contact their "upstream
DNS provider."

Finally, a weekend later, the DS record was gone and Google's DNS servers were
serving my records again. Additionally, I switched over to using my own BIND
name server so I could have full control over my DNS. This proved to be quite
fun to set up. The second server is hosted by a good friend of mine and the
third one by a friend of that friend. So far, other than me accidentally
forgetting to enable named.service and rebooting my server to find that DNS
wasn't working very well, I've had no problems.
