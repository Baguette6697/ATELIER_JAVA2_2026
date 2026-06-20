<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="exercice.Etudiant" %>
<%@page import="exercice.Produit" %>
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

<%-- Generate random names for students --%>
<%
    String[] prenoms = {"Alice", "Baptiste", "Clara", "David", "Emma", "François", "Gabrielle", "Henri", "Isabelle", "Jean"};
    int index1 = (int)(Math.random() * prenoms.length);
    int index2 = (int)(Math.random() * prenoms.length);
    int index3 = (int)(Math.random() * prenoms.length);
    
    // Creating 3 students with different constructors
    Etudiant e2_1 = new Etudiant();
    Etudiant e2_2 = new Etudiant(prenoms[index1]);
    Etudiant e2_3 = new Etudiant(prenoms[index2], 15.5);
%>
<p><strong>Résultat Exercice 2 :</strong></p>
<p>Étudiant 1 (constructeur par défaut) :</p>
<ul>
    <li>Nom : <%= e2_1.nom %></li>
    <li>Note : <%= e2_1.note %></li>
</ul>
<p>Étudiant 2 (constructeur avec nom uniquement) :</p>
<ul>
    <li>Nom : <%= e2_2.nom %></li>
    <li>Note : <%= e2_2.note %></li>
</ul>
<p>Étudiant 3 (constructeur avec nom et note) :</p>
<ul>
    <li>Nom : <%= e2_3.nom %></li>
    <li>Note : <%= e2_3.note %></li>
</ul>

<h2>Exercice 3 : Chaîner les constructeurs avec this()</h2>
<p>Dans la classe <code>Etudiant</code>, modifier le constructeur sans paramètre pour qu'il appelle le constructeur à deux paramètres avec <code>this("Anonyme", 10)</code>.</br>
Cela évite la duplication du code d'initialisation.</p>

<p><strong>Résultat Exercice 3 :</strong></p>
<p>Le constructeur par défaut appelle maintenant le constructeur à deux paramètres via <code>this()</code> :</p>
<p>Étudiant créé : <strong><%= e2_1.nom %></strong> avec la note <strong><%= e2_1.note %></strong></p>
<p><em>Cela évite la duplication du code d'initialisation dans plusieurs constructeurs.</em></p>

<h2>Exercice 4 : Le constructeur de copie</h2>
<p>Ajouter à la classe <code>Etudiant</code> un constructeur qui prend en paramètre un autre objet <code>Etudiant</code> et recopie ses attributs.</br>
Exemple d'utilisation :</br>
<code>Etudiant e1 = new Etudiant("Marie", 15);</code></br>
<code>Etudiant e2 = new Etudiant(e1);</code></p>

<%
    // Copy constructor example
    Etudiant e4_original = new Etudiant(prenoms[index3], 18.5);
    Etudiant e4_copie = new Etudiant(e4_original);
%>
<p><strong>Résultat Exercice 4 :</strong></p>
<p>Étudiant original :</p>
<ul>
    <li>Nom : <%= e4_original.nom %></li>
    <li>Note : <%= e4_original.note %></li>
</ul>
<p>Copie de l'étudiant :</p>
<ul>
    <li>Nom : <%= e4_copie.nom %></li>
    <li>Note : <%= e4_copie.note %></li>
</ul>

<h2>Exercice 5 : Valider les paramètres dans le constructeur</h2>
<p>Créer une classe <code>Produit</code> avec un attribut <code>prix</code> (double).</br>
Dans le constructeur, refuser un prix négatif : si <code>prix &lt; 0</code>, forcer la valeur à 0.</br>
Tester avec un produit créé à -50€ et afficher son prix réel.</p>

<%
    // Creating a product with a negative price
    Produit p5 = new Produit(-50);
%>
<p><strong>Résultat Exercice 5 :</strong></p>
<p>Produit créé avec un prix de <strong>-50€</strong> :</p>
<p>Prix réel après validation : <strong><%= String.format("%.2f", p5.prix) %>€</strong></p>
<p><em>Le prix négatif a été automatiquement forcé à 0 par le constructeur.</em></p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
