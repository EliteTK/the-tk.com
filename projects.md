---
layout: default
title: Projects
---
Projects
========
Here is a list of notable projects, information about each can be found in the
README.md located in the root directory of each project on github.

[c-stuff][c-stuff]
---------
This is a large collection of small projects and tests, there is stuff here
which some might find useful. Most of the code is licensed under the GPLv3.

### [timer][timer]
This is a simple command line beeping countdown timer. Despite its simplicity,
it's very useful. It can be found in the [aur][timer-aur].

[the-tk.com][the-tk]
------------
This is the source of the old website. I will soon be replacing it with the
source for this version.

### IP Echo Server
This simple fastcgi ip echo thing written in C.

{% highlight c %}
#include <fcgi_stdio.h>
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    while (FCGI_Accept() >= 0) {
        printf("Content-type: text/plain; charset=UTF-8\n");
        printf("Status: 200 OK\n");
        printf("\n");
        printf("%s", getenv("REMOTE_ADDR"));
    }

    return EXIT_SUCCESS;
}
{% endhighlight %}

It attempts to quickly return a clean output, no decoration, text/plain and not
even a new line.

[vav][vav]
-----
VAV (Very Awesome Vectors) is a C library which aims to provide neat looking
vectors in C. These might not be entirely practical since they cause quite an
overhead in the creation and calculations using vectors, but the code can be a
source of interesting ideas.


[minecurses][minecurses]
------------
This is a clone of minesweeper written in C using ncurses. The code is quite
awful in the current master branch and the redo branch is not in any way able
to be compiled. However, in the future this might possibly improve. A -git
package can be found in the Arch Linux AUR.


[dotfiles][dotfiles]
----------
These are the files from my .config directory, the only things which are
actually useful may be the vimrc, i3 config and i3blocks config.

[c-stuff]:    https://github.com/EliteTK/c-stuff "EliteTK/c-stuff · GitHub"
[timer]:      https://github.com/EliteTK/c-stuff/blob/master/timer.c "c-stuff/timer at master · EliteTK/c-stuff"
[timer-aur]:  https://aur4.archlinux.org/packages/timer-git/ "timer-git"
[the-tk]:     https://github.com/EliteTK/the-tk.com/ "EliteTK/the-tk.com · GitHub"
[vav]:        https://github.com/EliteTK/vav/ "EliteTK/vav · GitHub"
[minecurses]: https://github.com/EliteTK/minecurses/ "EliteTK/minecurses · GitHub"
[dotfiles]:   http://github.com/EliteTK/dotfiles/ "EliteTK/dotfiles · GitHub"
