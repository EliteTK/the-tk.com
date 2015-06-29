---
layout:     post
title:      "It's alive... again..."
date:       2015-06-28 17:00:00
category: rants
---
After putting it off for a few months, and a weekend of trying to make the
perfect simple stylesheet, I finally got around to re-doing my website. It's
now simpler, easier to read and actually has a blog.

Initially I was going to write my own static content generator in python using
[Jinja2][jinja], pygments and docutils. I realise that doing this was going to
be a giant pain and I didn't quite have the time to actually try to make one.
I've heard about [Jekyll][jekyll] before and decided to investigate. I was
hoping it was written in python but was instead written in ruby, however, in
the end, this didn't matter.

I was initially greeted by an _interesting_ layout and became worried that if I
went any further I would be here for the rest of the day trying to wrangle the
thing into submission.

I started with the basics, I changed a few details in the config, this made
some text change and remove some other text so I went about exploring. I knew
Jekyll was using [Liquid][liquid] templates and having used Jinja before I knew what I
was looking for.

I quickly discovered that `/_layouts` stored a set of "base" templates which
included a set of templates from `/_includes` to bring stuff together. This
wasn't too bad.

I then found `/css` or more importantly `/css/main.scss`. I've never seen an
"scss" extension before but at first glance it looked a bit like CSS. At a
second glance it looked like a css generator. I didn't really need this, the
CSS for this website is in no way complex enough to warrant templating css, so
I got to work modifying the existing `_layouts` and `_includes`, and simply
copied in my usual css.

Within about 10 minutes I had a working front page design but I noticed
something annoying; the generated HTML had about 10 line breaks in the middle
and generally looked like a mess. I realised that most of this space was
because of Liquid's tokens leaving space. After moving all the tokens around in
a way which meant that minimal breaks were introduced, I was left with
something presentable.

But this wasn't the end of the weirdness, the next problem was that for some
reason, the indentation on the very first line of an imported template was
always correct, but subsequent indentation was broken. (I was hoping that, like
many text editors, Liquid might take the indent on the line where a block is
being pasted and copy it for every line of the block, but on second thought,
this might not be desirable for for example, `<pre>`). I had to fix this by
indenting all but the first line correctly in every `/_includes` template and
this managed to cover most of the cases.

In the end, after pasting the syntax highlighting from
`/_sass/_syntax-highlighting.scss` into my stylesheet and manually "generating"
all the required entries. I was left with this very end result you see before
you. As a final verdict, I really do think that Jekyll is quite awesome even
though I've probably not used it in the most efficient fashion. All things
considered, however, this only took about an hour.

Now, bask in the glory of the syntax highlighting:

{% highlight c %}
#include <stdio.h>

int main(void)
{
	puts("Colours!!!");

	return 0;
}
{% endhighlight %}

[jekyll]: http://jekyllrb.com
[jinja]:  http://jinja.pocoo.org/
[liquid]: http://liquidmarkup.org/
