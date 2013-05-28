---
layout: page
title: Porneia delights' README
description: I used to be schizophrenic but now we are going much better.<br> We are the <b>Porneia delights</b>. We are persistent and reluctant.<br> We also do not really come from outer space.
---
Dernière mise à jour du Porneia delights : {{ site.time | date: "%Y-%m-%d %H:%M:%S %z" }}

Site statique automatiquement généré par
[Jekyll](http://github.com/mojombo/jekyll) dont les sources sont
disponibles [en ligne](https://github.com/porneia/pub).

### Changelog ###

2012-04-19 01:41:38 +0200

     * Removed code/ cookbook/ paste/ nh/ folders from jekyll's hand
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

- finir de réimporter les vieux articles de tout le monde
- organiser les articles aussi en catégories (sur une seule page)
- mettre en place des tags pour les notes/articles ?
- créer un fichier xml (RSS) avec tous les shaarlis connus (script ?)


### Liste des articles ###
{% for post in site.posts %}
{{ site.url | strip_slash }}{{ site.baseurl }}{{ post.url }}<br>{% endfor %}
