# Git / Git Flow

## Liens utiles

- https://www.grafikart.fr/formations/git
- https://openclassrooms.com/courses/1233741-gerez-vos-codes-source-avec-git
- https://danielkummer.github.io/git-flow-cheatsheet/index.fr_FR.html
- https://git-scm.com/docs

## Interface graphique

- https://desktop.github.com/
- https://www.gitkraken.com/
- https://www.supinfo.com/articles/single/2782-onze-meilleurs-clients-graphiques-git-linux

## Commandes utiles

- `git init` : permet d'initialiser un depot vide
- `git clone {adresse_du_repo}` : clone un repo distant afin de pouvoir y travailler dessus. Il va récupérer la branche principale avec tout son historique. Il sera bien sûr possible de récupérer les autres branches ensuite.
- `git status` : liste les fichiers modifiés qui n'ont pas été commités
- `git diff` : permet de voir les modifications
- `git diff src/mon_fichier.php` : permet de voir les modifications d'un fichier
- `git add src/fichier1 src/fichier2` : ajoute des fichiers dans la liste que vous voulez commiter
- `git add -a` : ajoute tous les fichiers modifiés dans la liste que vous voulez commiter
- `git commit` : permet de faire un nouveau commit
- `git commit -m "mon message de commit"` : permet de commiter en spécifiant directement le message de commit
- `git commit -a -m "mon message de commit"` : permet de commiter tous les fichiers modifiés (pas besoin de faire un `git add` avant) en spécifiant directement le message de commit. **Attention les nouveaux fichiers ne seront pas commités**
- `git log` : permet de voir la liste des précédents commits
- `git commit --amend` : permet de commiter dans le précédent commit
- `git reset HEAD^` : supprime le dernier commit mais conserve les modifications
- `git reset --hard HEAD^` : supprime le dernier commit et les modifications
- `git reset --hard HEAD` : revient à l'état du dernier commit (supprime les modifications non commitées)
- `git checkout src/monfichier` : annule les modifications d'un fichier avant un commit
- `git reset HEAD -- src/monfichier` : retire un fichier qui a été ajouté via `git add` avant d'être commité
- `git pull` : récupérer le travail distant, par exemple si on est sur la branche `develop` et qu'on veut récupérer le travail distant on fera `git pull origin develop`
- `git push` : envoi les nouveaux commits locaux sur le repo distant, par exemple si on est sur la branche `develop` on fera `git push origin develop`
- `git revert 6261cc2` : supprime le commit avec l'identifiant `6261cc2`
- `git branch` : liste les branches locales
- `git checkout -b mabranche` : création de la branche `mabranche` à partir de la branche courante et déplacement vers celle-ci
- `git checkout mabranche` : déplacement vers la branche `mabranche`
- `git merge develop` : si on est dans la branche `mabranche` cette commande permet d'intégrer le travail de `develop` dans `mabranche`
- `git branch -d mabranche` : supprime la branche `mabranche`. **Vérifie si elle a bien été mergé dans la branche courante et refuse si ce n'est pas le cas.
- `git branch -D mabranche` : supprime `mabranche` quoi qu'il arrive
- `git stash` : met les modifications courrantes de côté
- `git stash apply` : réapplique les modifications suite à un `git stash`

## Git ignore

### Ignorer les fichiers d'un dossier mais versionner le dossier

Nous souhaitons que le dossier `tmp` soit versionné mais que les fichiers à l'intérieur non. Il existe 2 solutions :

- .gitignore + empty : créer un fichier `èmpty` dans le dossier `tmp` puis créer un commit. Il faudra ensuite rajouter dans `.gitignore` la ligne `/tmp/`
- .gitignore dans tmp : créer un fichier `.gitignore` dans `tmp` avec le code suivant (ignore tous les fichiers sauf `.gitignore`) :
```
*
!.gitignore
```