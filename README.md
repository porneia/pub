---
title: Porneia delights' README
permalink: README.txt
---
# {{ page.title }}

Lastupdate: {{ site.time | date: "%Y-%m-%d %H:%M:%S %z" }}

The Porneia delights is automatically generated by
[Jekyll](http://github.com/mojombo/jekyll) into a static site.


### Changelog ###

2012-06-19 01:41:38 +0200

    * Removed code/ cookbook/ paste/ nh/ folders from jekyll hand
    * Now Jekyll takes care only for publications stuffs

2012-04-13 16:00:12 +0200

     * Shortly is up and running

2012-04-12 02:46:04 +0200

     * Migration to jekyll

2011-12-10 18:55:22 +0100

     * Shaarli is up and running

2011-07-05 00:00:01 +0200

     * Porneia delights public section is online


### TODO ###

- organiser les articles aussi en catégories (sur une seule page)
- mettre en place des tags pour les notes/articles ?


### Articles ###
{% for post in site.posts %}
{{ site.url | strip_slash }}{{ site.baseurl }}{{ post.url }}{% endfor %}
