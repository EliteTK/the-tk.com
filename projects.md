---
layout: default
title: Projects
---
# Projects
Here is a list of notable projects, information about each can be found in the
README.md located in the root directory of each project on GitHub.

## c-stuff
This is a large collection of small projects and tests, all sorts of people have
found something in here useful at some point. Most of the code is licensed under
the GNU GPLv3.
([GitHub link][c-stuff])

### timer
Part of the c-stuff repository, this is a simple command line beeping countdown
timer. Despite its simplicity, it's very useful. It can be found in the Arch
Linux [AUR][timer-aur]. I am considering splitting this up into its own
repository. ([GitHub link][timer])

## the-tk.com
This website is an ongoing project of mine, an attempt at writing a simple to
maintain static website with html which tries to avoid putting \<div>s
everywhere. I also hope that at least some of the stuff I write about can be
useful to some people. You can find the source for both the old website and the
new website in the GitHub repository. The source of the old website can be found
on the "old" branch. The website needs a slightly customized liquid, the nature
of this customization can be found [here][liquid-patch]. ([GitHub link][the-tk])

### IP Echo Server
This simple fastcgi ip echo thing written in C.

~~~
#include <fcgi_stdio.h>
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	while (FCGI_Accept() >= 0) {
		puts("Content-type: text/plain; charset=UTF-8");
		puts("Status: 200 OK");
		puts("");
		printf("%s", getenv("REMOTE_ADDR"));
	}

	return EXIT_SUCCESS;
}
~~~
{: .language-c}

It attempts to quickly return a clean output, no decoration, text/plain and not
even a new line.

Note: I've since been informed that it is possible to achieve this same result
with this simple nginx server block (and henceforth, the above C program is no
longer being used for <http://ip.the-tk.com/>):

~~~
server {
	listen 80;
	listen [::]:80;
	server_name ip.the-tk.com;

	default_type text/plain;

	return 200 $remote_addr;
}
~~~
{: .language-nginx}

## vav
VAV is a C library which aims to provide neat looking vectors in C. These might
not be entirely practical since they cause quite an overhead in the creation and
calculations using vectors, but the code can be a source of interesting ideas.
([GitHub link][vav])

## minecurses
This is a clone of minesweeper written in C using ncurses. The code is quite
awful in the current master branch and the redo branch is not in any way able
to be compiled. However, in the future this might possibly improve. A -git
package can be found in the Arch Linux [AUR][minecurses-aur].
([GitHub link][minecurses])

## dotfiles
These are the files from my .config directory, the only things which are
actually useful may be the vimrc, i3 config and i3blocks config. ([GitHub
link][dotfiles])

*[VAV]: Very Awesome Vectors

[c-stuff]:       https://github.com/EliteTK/c-stuff "EliteTK/c-stuff · GitHub"
[timer]:         https://github.com/EliteTK/c-stuff/blob/master/timer.c "c-stuff/timer at master · EliteTK/c-stuff"
[timer-aur]:     https://aur.archlinux.org/packages/timer-git/ "timer-git"
[the-tk]:        https://github.com/EliteTK/the-tk.com/ "EliteTK/the-tk.com · GitHub"
[liquid-patch]:  https://github.com/EliteTK/liquid/tree/replace_newlines "EliteTK/liquid at replace_newlines"
[vav]:           https://github.com/EliteTK/vav/ "EliteTK/vav · GitHub"
[minecurses]:    https://github.com/EliteTK/minecurses/ "EliteTK/minecurses · GitHub"
[minecurses-aur]:https://aur.archlinux.org/packages/minecurses-git/ "minecurses-git"
[dotfiles]:      http://github.com/EliteTK/dotfiles/ "EliteTK/dotfiles · GitHub"
