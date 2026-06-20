<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="exercice.Forme" %>
<%@page import="exercice.Cercle" %>
<%@page import="exercice.Carre" %>
<%@page import="exercice.Affichable" %>
<html>
<head>
<title>Le polymorphisme</title>
</head>
<body bgcolor=white>
<h1>Exercices sur le polymorphisme</h1>
<form action="#" method="post">
    <p>Saisir le nom d'un chien : <input type="text" name="chien">
    <p>Saisir le nom d'un chat : <input type="text" name="chat">
    <p><input type="submit" value="Faire crier les animaux">
</form>

<%-- Une classe mère Animal et deux classes filles qui redéfinissent la méthode crier() --%>
<%!
    class Animal {
        String nom;
        public Animal(String nom) { this.nom = nom; }
        public String crier() { return "..."; }
        
        // Exercice 1: toString()
        @Override
        public String toString() { return "Animal nommé " + nom; }
    }

    class Chien extends Animal implements Affichable {
        public Chien(String nom) { super(nom); }
        public String crier() { return "Wouf wouf !"; }
        
        // Exercice 1: toString()
        @Override
        public String toString() { return "Chien nommé " + nom; }
        
        // Exercice 3: Affichable interface
        @Override
        public String afficher() { return nom + " (chien)"; }
    }

    class Chat extends Animal implements Affichable {
        public Chat(String nom) { super(nom); }
        public String crier() { return "Miaou !"; }
        
        // Exercice 1: toString()
        @Override
        public String toString() { return "Chat nommé " + nom; }
        
        // Exercice 3: Affichable interface
        @Override
        public String afficher() { return nom + " (chat)"; }
    }
    
    // Exercice 4: Oiseau class
    class Oiseau extends Animal {
        public Oiseau(String nom) { super(nom); }
        public String crier() { return "Cui cui !"; }
        
        @Override
        public String toString() { return "Oiseau nommé " + nom; }
    }
%>

<%-- Récupération des valeurs du formulaire --%>
<% String chien = request.getParameter("chien"); %>
<% String chat = request.getParameter("chat"); %>

<% if (chien != null && chat != null && !chien.isEmpty() && !chat.isEmpty()) { %>

    <%-- Tableau d'Animal contenant en réalité un Chien et un Chat --%>
    <% Animal[] animaux = { new Chien(chien), new Chat(chat) }; %>

    <p>Démonstration du polymorphisme :</br>
    Le tableau est déclaré <code>Animal[]</code>, mais c'est bien la méthode <code>crier()</code> de la sous-classe (Chien ou Chat) qui est appelée à l'exécution.</p>

    <% for (Animal a : animaux) { %>
        <p><%= a.nom %> dit : <%= a.crier() %></p>
    <% } %>

<h2>Exercice 1 : Redéfinir toString()</h2>
<p>Ajouter à la classe <code>Animal</code> et à ses sous-classes <code>Chien</code> et <code>Chat</code> une méthode <code>toString()</code> qui retourne par exemple :</br>
"Chien nommé Rex" ou "Chat nommé Felix".</br>
Afficher <code>a.toString()</code> pour chaque animal du tableau.</p>

<p><strong>Résultat Exercice 1 :</strong></p>
<% for (Animal a : animaux) { %>
    <p><%= a.toString() %></p>
<% } %>

<h2>Exercice 2 : La classe abstraite Forme</h2>
<p>Créer une classe abstraite <code>Forme</code> avec une méthode abstraite <code>aire()</code>.</br>
Créer deux sous-classes :</br>
- <code>Cercle</code> avec un attribut <code>rayon</code>,</br>
- <code>Carre</code> avec un attribut <code>cote</code>.</br>
Implémenter <code>aire()</code> dans chacune. Créer un tableau de <code>Forme</code> contenant les deux et afficher leurs aires.</p>

<%
    // Create forms with random dimensions
    Forme[] formes = { new Cercle(5), new Carre(4) };
%>

<p><strong>Résultat Exercice 2 :</strong></p>
<ul>
    <li>Cercle avec rayon 5 : Aire = <%= String.format("%.2f", formes[0].aire()) %></li>
    <li>Carré avec côté 4 : Aire = <%= String.format("%.2f", formes[1].aire()) %></li>
</ul>

<h2>Exercice 3 : L'interface Affichable</h2>
<p>Créer une interface <code>Affichable</code> avec une méthode <code>afficher()</code>.</br>
Faire implémenter cette interface par <code>Chien</code> et <code>Chat</code>.</br>
Stocker un Chien et un Chat dans un tableau <code>Affichable[]</code> et appeler <code>afficher()</code> sur chacun.</p>

<%
    // Create Affichable array
    Affichable[] affichables = { new Chien(chien), new Chat(chat) };
%>

<p><strong>Résultat Exercice 3 :</strong></p>
<table border="1" cellpadding="10" cellspacing="0" style="border-collapse: collapse;">
    <thead>
        <tr style="background-color: #f0f0f0;">
            <th>Nom</th>
            <th>Type d'animal</th>
            <th>Bruit</th>
        </tr>
    </thead>
    <tbody>
        <% 
            for (Affichable a : affichables) {
                Animal animal = (Animal) a;
                String type = "";
                if (animal instanceof Chien) {
                    type = "Chien";
                } else if (animal instanceof Chat) {
                    type = "Chat";
                } else {
                    type = "Autre animal";
                }
        %>
        <tr>
            <td><%= animal.nom %></td>
            <td><%= type %></td>
            <td><%= animal.crier() %></td>
        </tr>
        <% } %>
    </tbody>
</table>

<h2>Exercice 4 : Ajouter un Oiseau</h2>
<p>Créer une nouvelle sous-classe <code>Oiseau</code> qui hérite de <code>Animal</code> et redéfinit <code>crier()</code> par "Cui cui !".</br>
L'ajouter dans le tableau d'animaux ci-dessus, <strong>sans modifier la boucle d'affichage</strong>.</br>
Constater que le code de la boucle continue de fonctionner : c'est tout l'intérêt du polymorphisme.</p>

<%
    // Add Oiseau to the animal array
    Animal[] animauxEtendu = { new Chien(chien), new Chat(chat), new Oiseau("Tweety") };
%>

<p><strong>Résultat Exercice 4 :</strong></p>
<p><em>Les trois animaux sans modification de la boucle :</em></p>
<% for (Animal a : animauxEtendu) { %>
    <p><%= a.nom %> dit : <%= a.crier() %></p>
<% } %>

<h2>Exercice 5 : L'opérateur instanceof</h2>
<p>Dans la boucle qui parcourt les animaux, utiliser <code>instanceof</code> pour afficher un message spécifique :</br>
- "C'est un chien" si l'animal est un <code>Chien</code>,</br>
- "C'est un chat" si l'animal est un <code>Chat</code>,</br>
- "Autre animal" dans tous les autres cas.</p>

<p><strong>Résultat Exercice 5 :</strong></p>
<% for (Animal a : animauxEtendu) { %>
    <p><%= a.nom %> - 
    <% if (a instanceof Chien) { %>
        C'est un chien
    <% } else if (a instanceof Chat) { %>
        C'est un chat
    <% } else { %>
        Autre animal
    <% } %>
    </p>
<% } %>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
