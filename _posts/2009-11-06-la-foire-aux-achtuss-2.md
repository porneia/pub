---
layout: post
title: "La Foire aux Achtuss #2"
date: 2009-11-06 03:06:28 +0100
author: illov&aelig;
mail: illovae[at]bk[dot]ru
description:
commentaire:
category:
tags: []
keywords: foire, astuces, tips, GNU/Linux, achtuss, illovae
license: "WTFPL(v2) - Beerware License"
---
<span class="articleAuthor">D Weblog System, 06 novembre 2009,
{{ page.author }}</span> &mdash; Un peu plus d'un an après la <a href="{{ site.url }}{{ site.baseurl}}/articles/la-foire-aux-achtuss-1.html"
class="external"
hreflang="fr">première édition</a>, je me décide enfin à continuer
cette série (le fait d'avoir retrouvé mes vieilles notes à ce sujet ne
doivent pas y être pour rien...). Je me propose ici de diffuser les
diverses infos et tips que j'ai pu glaner au fur et à mesure des
années et que j'ai noté. Ça pourra peut-être servir à quelqu'un (même
si certaines sont vraiment useless), on ne sait jamais... Je les
restitue comme je les avait notée à l'époque.

Si vous avez une commande ou une astuce de la mort qui tue qu'elle est
trop bien que vous pouvez plus vous en passez, n'hésitez pas a me
l'envoyer, je me ferais une joie de la mettre dans la prochaine édition
de la Foire aux Achtuss :)


- **Achtuss n16** : Au lieu de se prendre la tête à supprimer les
cinqs premiers caractères de chaque début de lignes d'un fichier
`prout.txt` de mille ligne il suffit de faire simplement `$ cut -c 6-
prout.txt > prout2.txt`


- **Achtuss n17** : Comme cela arrive parfois, on a plusieurs
applications qui font le même boulot (par exemple les navigateurs
internet). Sous Debian il est assez facile de choisir lequel sera
choisi par défaut parmi la liste de ceux installés, en entrant
simplement cette commande : `# update-alternatives --config
x-www-browser`


- **Achtuss n18** : Toujours sous Debian. Si on fait une
désinstallation de paquets standard avec `apt-get`, il restera (selon
les applications) tous les fichiers de configuration de ces
softs. Pour éviter cela (sauf si on veut les garder bien sûr), il faut
rajouter l'option `purge` à la commande comme suit : `# apt-get remove
--purge lenomdupaquet`. C'est un truc assez connu. Cependant, que
faire si on a deja désinstaller les programmes sans avoir utiliser
cette option ? Que faire pour virer ces fameux fichiers de
configuration inutiles ?  Simplement en utilisant cette commande : `#
dpkg --purge $(dpkg --get-selections | grep deinstall$ | cut -f 1)`
(Merci Valouille pour le truc ;)).


- **Achtuss n19** : Alors deux ou trois petites choses pour
déshabiller un .deb : `$ dpkg -c *.deb` pour voir son contenu, `$ dpkg
-f *deb` pour voir les dépendances et `$ dpkg -I *deb
{pre,post}{inst,rm}` pour voir le fichier de configuration.


- **Achtuss n20** : Pour debuilder sans signer (quand on fait des
paquets Debian), il faut utiliser les options `-us -uc` (Merci
Adri2000 pour celle-ci). De plus, quand on veut debuilder lors d'un
bugfix, inutile d'inclure les sources, donc un simple `debuild -S`
suffit...


- **Achtuss n21** : Ah, une commande que m'avait donné <a
href="http://blog.racoon97.net/" class="external"
hreflang="fr">racoon97</a> il y longtemps pour réencoder une vidéo en
incrustant des sous-titres disponibles dans un srt (en utilisant
mencoder) : `$ mencoder video_source.avi -sub fichier_soustitres.srt
-fontconfig -font Arial -subfont-text-scale 4 -oac copy -ovc lavc -o
video_finale.avi`


- **Achtuss n22** : Admettons un fichier gros de dix mille lignes et
vous voulez sélectionner tout ce qui se trouve après `BRAVO` en plein
milieu du fichier : `awk` devient secourable alors : `$ cat fichier |
awk '/BRAVO/,EOF'`. Merci a gapz pour celle-ci ;)


- **Achtuss n23** : Sous Gentoo, pour faire une mise à jour complète
avec `emerge`, on fait simplement : `# emerge -vNDup world`. On peut
rajouter l'option `-a` histoire qu'il nous demande si on est sûr de
vouloir effectuer l'opération (ce qui est pratique pour vérifier les
USES flags...). À noter qu'on peut utiliser `genlop` histoire de
savoir combien de temps ça va prendre (pour ça il faut avoir déjà
installer les ebuilds afin qu'il puisse faire les estimations ; il
faut aussi avoir emerger `genlop`, cela va sans dire) : `# emerge
-puDN world | genlop -p`


- **Achtuss n24** : Deux trucs indispensables pour les débutants
gentooiste : `gentoolkits` et `portage-kits`. Dedans vous trouverez
des choses très utiles comme `etc-update`, la suite `q*` mais aussi
`equery`... Émergez `eix` aussi, c'est très pratique.


- **Achtuss n25** : Avec iptables, pour bannir `$ATTACKER_IP`
(remplacez par l'IP voulue bien sûr) : `# iptables -A INPUT -s
$ATTACKER_IP -j DROP`


- **Achtuss n26** : Encore une fois sous Gentoo, quand on veut
installer `texlive`, on se retrouve avec tout un tas (pratiquement
tous en fait) d'ebuild protégés par un mask architecture. Au lieu de
se prendre la tête à vérifier et à tous les rajouter à la main, il
suffit de faire quelque chose du genre : `# cd /usr/portage && for i
in app-text/texlive*; do echo $i >> /etc/portage/package.keywords;
done`. Ainsi, tous les ebuilds commencant par texlive se retrouveront
dans votre fichier `package.keywords`... Très pratique, n'est-ce pas ?
Merci a Ycarus pour cette dernière.


- **Achtuss n27** : Ah un truc que j'ai encore dans mon fichier
`xinitrc`. Avec Xorg, pour ne pas avoir l'écran qui se met en veille
tout seul au bout d'une demi-heure, il suffit de modifier les
paramètres de X avec `xset` ; tout ça à rajouter dans votre fichier
`~/.xinitrc` donc histoire que ça se charge à chaque lancement de
session X : `xset dpms 0 0 0 xset s off`


- **Achtuss n28** : Un vieux truc qui marche dans les consoles. On
connaît tous ce que fait `ctrl-c` ou encore `ctrl-z` (arrêter et
mettre en pause pour les retardataires). Et bien sachez que `ctrl-s`
et `ctrl-q` sont utilisés pour contrôler le flux de donnée qui
s'affiche dans votre terminal. Si vous voulez arrêter le flux, tapez
simplement `ctrl-s` (pendant un truc avec un super longue sortie comme
un `ls -R /` par exemple). Pour que le flux reprenne, `ctrl-q` est la
solution. Tips trouvée <a
href="http://pangea.stanford.edu/computerinfo/unix/shell/loginstuck.html"
class="external" hreflang="en">ici</a>.


- **Achtuss n29** : Nom d'un chien §#@!!§ Pour connaître le keycode
d'une des touches du clavier, on utilise le programme `xev` !!1


- ** Achtuss n30** : Quand on se retrouve avec des sources sans
configure, on peut s'en créer un avec `autoconf`. Si jamais
`./configure` gueule parce qu'il n'y a pas de fichier `config.sub`, on
peut en générer un avec : `$ libtoolize --force --copy`
