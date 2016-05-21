---
layout: default
---
# Welcome

Welcome, this is my experiment, I no longer consider it a work in progress but I
still think that my [GitHub][github] would probably be more interesting.

## Recent blogposts:
<ul class="postlist">{% for post in site.posts limit: 3 %}
  <li>
    <article>
      <header>
        <h3>{{ post.title }}</h3>
      </header>
      {{ post.excerpt|strip_html }} <a href="{{ post.url|prepend: site.baseurl }}">Read more...</a>
      <footer>
        <time>{{ post.date|date: "%Y-%m-%d" }}</time>
      </footer>
    </article>
  </li>
{% endfor %}</ul>

[github]: https://github.com/EliteTK/ "EliteTK (Tomasz Kramkowski)"
