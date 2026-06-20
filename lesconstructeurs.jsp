<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="exercice.Etudiant" %>
<html>
<head>
<title>Les constructeurs</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les constructeurs</h1>
<form action="#" method="post">
    <p>Saisir un titre de livre : <input type="text" name="titre">
    <p>Saisir un auteur : <input type="text" name="auteur">
    <p><input type="submit" value="Créer les livres">
</form>

<%-- Une classe Livre avec deux constructeurs : par défaut et avec paramètres --%>
<%!
    class Livre {
        String titre;
        String auteur;

        // Constructeur par défaut
        public Livre() {
            this.titre = "Titre inconnu";
            this.auteur = "Auteur inconnu";
        }

        // Constructeur avec paramètres
        public Livre(String titre, String auteur) {
            this.titre = titre;
            this.auteur = auteur;
        }
    }
%>

<%-- Récupération des valeurs du formulaire --%>
<% String titre = request.getParameter("titre"); %>
<% String auteur = request.getParameter("auteur"); %>

<% if (titre != null && auteur != null) { %>

    <%-- Création de deux livres : un via le constructeur par défaut, l'autre avec les valeurs saisies --%>
    <% Livre livreVide = new Livre(); %>
    <% Livre livrePlein = new Livre(titre, auteur); %>

    <p>Livre créé via le constructeur par défaut :</p>
    <p>Titre : <%= livreVide.titre %> - Auteur : <%= livreVide.auteur %></p>

    <p>Livre créé via le constructeur avec paramètres :</p>
    <p>Titre : <%= livrePlein.titre %> - Auteur : <%= livrePlein.auteur %></p>

<h2>Exercice 1 : Le constructeur par défaut</h2>
<p>Créer une classe <code>Etudiant</code> avec un constructeur par défaut qui initialise :</br>
- l'attribut <code>nom</code> à "Anonyme"</br>
- l'attribut <code>note</code> à 10.</br>
Instancier un étudiant avec ce constructeur et afficher ses informations.</p>

<%-- STEP 1: Call and display the Etudiant class with default constructor --%>
<%
    // Creating a student with the default constructor
    Etudiant etudiant1 = new Etudiant();
%>
<p><strong>Résultat Exercice 1 :</strong></p>
<p>Étudiant créé via le constructeur par défaut :</p>
<ul>
    <li>Nom : <%= etudiant1.nom %></li>
    <li>Note : <%= etudiant1.note %></li>
</ul>

<h2>Exercice 2 : La surcharge de constructeurs</h2>
<p>Ajouter à la classe <code>Etudiant</code> deux autres constructeurs :</br>
- un constructeur prenant uniquement le <code>nom</code> en paramètre (la note vaut 10 par défaut),</br>
- un constructeur prenant le <code>nom</code> et la <code>note</code> en paramètres.</br>
Créer 3 étudiants avec les 3 constructeurs et afficher leurs informations.</p>

<h2>Exercice 3 : Chaîner les constructeurs avec this()</h2>
<p>Dans la classe <code>Etudiant</code>, modifier le constructeur sans paramètre pour qu'il appelle le constructeur à deux paramètres avec <code>this("Anonyme", 10)</code>.</br>
Cela évite la duplication du code d'initialisation.</p>

<h2>Exercice 4 : Le constructeur de copie</h2>
<p>Ajouter à la classe <code>Etudiant</code> un constructeur qui prend en paramètre un autre objet <code>Etudiant</code> et recopie ses attributs.</br>
Exemple d'utilisation :</br>
<code>Etudiant e1 = new Etudiant("Marie", 15);</code></br>
<code>Etudiant e2 = new Etudiant(e1);</code></p>

<h2>Exercice 5 : Valider les paramètres dans le constructeur</h2>
<p>Créer une classe <code>Produit</code> avec un attribut <code>prix</code> (double).</br>
Dans le constructeur, refuser un prix négatif : si <code>prix &lt; 0</code>, forcer la valeur à 0.</br>
Tester avec un produit créé à -50€ et afficher son prix réel.</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
