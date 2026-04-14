# Réponses — Évaluation Séance 3

## Développement d'applications mobiles — Bachelor 2 Informatique

> **Nom / Prénom :** Chloé Alexandre
> **Date :** 14 avril 2026

---

## Question 1 — StatefulWidget vs StatelessWidget

> Pourquoi l'écran de la todo list est-il un `StatefulWidget` et non un `StatelessWidget` ?  
> Que se passerait-il concrètement si on avait utilisé un `StatelessWidget` à la place ?

_Votre réponse (3 à 5 lignes) :_

Un StatelessWidget n'affiche que des données statiques et ne peut pas se mettre à jour, un StatefullWidget si. Si on avait utilisé un StatelessWidget on aurait eu un écran incapable d'afficher les changements dans la todo liste (ajouts, suppressions, tâches effectuées).

---

## Question 2 — Le rôle de setState

> Que fait exactement `setState` dans le cycle de vie d'un widget Flutter ?  
> Que se passe-t-il si on modifie la liste de tâches (ajout, suppression, toggle) **sans** appeler `setState` ?

_Votre réponse (3 à 5 lignes) :_

SetState sert à indiquer que les données ont changé, sans lui si on modifie _tasks, les données sont bien modifiées en mémoire mais rien ne se passe au niveau de l'affichage, pour l'utilisateur rien ne change ce qui rend l'ensemble peu utile.

---

## Question 3 — La pile de navigation

> Expliquez le mécanisme de la pile de navigation Flutter.  
> Quand on navigue vers l'écran Statistiques, puis qu'on revient : que se passe-t-il en mémoire avec les écrans ? L'écran principal est-il reconstruit ?

_Votre réponse (3 à 5 lignes) :_

Les écrans se "superposent", c'est tout le principe d'une pile. Quand on est sur l'écran principal et qu'on ouvre l'écran des stats celui ci est construit, et quand on appuie sur retour il disparait pour réafficher l'écran principal qui n'a pas bougé, il n'est reconstruit que si les données changent.

---

## Question 4 — Bug de déclaration

> Un étudiant déclare son `TextEditingController` **à l'intérieur** de la méthode `build()` au lieu de le déclarer comme variable d'instance dans le `State`. Son champ de texte semble se comporter bizarrement.
>
> Expliquez le problème que cela pose et pourquoi.

_Votre réponse (3 à 5 lignes) :_

On recréé un controler à chaque build, ce qui va empêcher les mises à jour et créer une fuite mémoire à cause des anciens controlers jamais nettoyés.

---

## Question 5 — Choix de conception

> Votre application gère les tâches avec une simple `List` en mémoire. Quand l'utilisateur ferme l'application, toutes les tâches disparaissent.
>
> — Nommez une approche ou un package Flutter qui permettrait de persister les données entre deux lancements de l'app.  
> — Sans écrire de code, expliquez où dans l'architecture de l'app vous feriez les modifications.

_Votre réponse (3 à 5 lignes) :_

Je pense que path_provider devrait suffire, les données sont simples SQLite serait overkill, je pense qu'il suffirait de créer un simple fichier texte de sauvegarde quelquepart, avec une architecture style JSON ou YAML.