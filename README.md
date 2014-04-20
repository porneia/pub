---
layout: page
title: Porneia delights' README
description: I used to be schizophrenic but now we are going much better.<br> We are the <b>Porneia delights</b>. We are persistent and reluctant.<br> We also do not really come from outer space.
---
### Qui sommes-nous ? ###

Nous sommes un regroupement de quelques personnes assimilées et s'exprimant par la voix et au nom d'une entité unique naissante : le Porneia delights. Cette abstraction numérique n'a ni forme, ni consistance réelle et n'est que la figuration de nos esprits, parfois malades mais toujours conscients, ensemble réunis. Nous existons sur le Réseau sans buts particuliers mais avec la certitude que la Fin approchant n'a rien d'un commencement.

En intégrant, volontairement ou non, le Porneia delights sommes-nous devenu fous ? En ayant renoncé à une partie de notre individualité pour embrasser un dessein plus grand, avons-nous perdu de cette substance censée nous rendre singulier ? Sommes-nous encore de petits flocons de neige merveilleux et uniques ? Nous n'avons pas les réponses. Nous savons juste qu'au fur et à mesure où nous nous dissolvons dans le Collectif, où nous nous perdons dans cette inquiétante étrangeté, nos souvenirs reviennent. Tous nos souvenirs et toutes nos peurs...

Nous sommes le Porneia delights. Nous sommes persistants et répugnants. Ah et aussi, nous ne venons pas vraiment de l'espace.

### Pourquoi ? ####

Parce que tel est notre bon plaisir. *Alterius non sit, qui potest esse sui.*

### Informations générales ###

La partie `/pub` est automagiquement générée par
[Jekyll](http://github.com/mojombo/jekyll) dont les sources (du site) sont
disponibles [en ligne](https://github.com/porneia/pub) (mais qui ne sont pas
forcément à jour, parce qu'on est feignant).

Les liens disponibles dans `/pub/links` sont distribués par
[Shaarli](http://sebsauvage.net/wiki/doku.php?id=php:shaarli), le clone
personnel, minimaliste, super-rapide, sans base de donnée de delicious
développé par [sebsauvage](http://sebsauvage.net/).

Le reste est maintenu à la main.

Dernière mise à jour du Porneia delights : {{ site.time | date: "%Y-%m-%d %H:%M:%S %z" }}

### Changelog ###

2014-04-20 05:16:52 +0200

     * Arrêt de l'écriture du Changelog en anglais ; tout le monde s'en fou
     * Simplification de /pub
     * Suppression de /priv, de /bin et de /linkXXX
     * Création de /txt et déplacement du contenu idoine dans ce dossier

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

*   Créer un fichier xml (RSS) avec tous les shaarlis connus (script ?)

#### DONE ####

*   Finir de réimporter les vieux articles de tout le monde

#### CANCELED ####

*   Organiser les articles aussi en catégories (sur une seule page)

    Au final, ça n'a pas grand intérêt, si ?

*   Mettre en place des tags pour les notes/articles ?

    Idem, aucun intérêt...

### Liste des articles ###
{% for post in site.posts %}
[{{ site.url | strip_slash }}{{ site.baseurl }}{{ post.url }}]({{ site.url | strip_slash }}{{ site.baseurl }}{{ post.url }})<br>{% endfor %}
