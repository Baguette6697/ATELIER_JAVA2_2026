<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- STEP 1: Import your external classes at the top --%>
<%@page import="exercice.Voiture" %> 
<%@page import="exercice.Rectangle" %> 
<%@page import="exercice.CompteBancaire" %> 

<html>
<head>
<title>Les objets</title>
</head>
<body bgcolor=white>
<h1>Exercices sur les objets</h1>
<form action="#" method="post">
    <p>Saisir un nom : <input type="text" name="nom">
    <p>Saisir un âge : <input type="text" name="age">
    <p><input type="submit" value="Créer la personne">
</form>

<%-- Déclaration d'une classe Personne avec deux attributs --%>
<%!
    class Personne {
        String nom;
        int age;

        // Méthode seDecrire pour l'exercice 2
        String seDecrire() {
            return "Je m'appelle " + nom + " et j'ai " + age + " ans";
        }
    }
%>

<%-- Récupération des valeurs du formulaire --%>
<% String nom = request.getParameter("nom"); %>
<% String age = request.getParameter("age"); %>

<% if (nom != null && age != null && !nom.isEmpty() && !age.isEmpty()) { %>

    <%-- Instanciation d'un objet Personne et affectation des attributs --%>
    <% Personne p = new Personne(); %>
    <% p.nom = nom; %>
    <% p.age = Integer.parseInt(age); %>

    <p>Objet Personne créé !</p>
    <p>Nom : <%= p.nom %></p>
    <p>Age : <%= p.age %> ans</p>

<h2>Exercice 1 : La classe Voiture</h2>
<p>Créer une classe <code>Voiture</code> avec les attributs <code>marque</code>, <code>modele</code> et <code>annee</code>.</br>
Instancier une voiture, lui affecter des valeurs et afficher ses caractéristiques.</p>

<%-- STEP 2: Call and display your external Voiture class here --%>
<%
    // Instantiating the external Voiture object
    Voiture maVoiture = new Voiture("Renault", "Clio", 2021);
%>
<p><strong>Résultat Exercice 1 :</strong></p>
<ul>
    <li>Marque : <%= maVoiture.marque %></li>
    <li>Modèle : <%= maVoiture.modele %></li>
    <li>Année : <%= maVoiture.annee %></li>
</ul>


<h2>Exercice 2 : Ajouter une méthode à la classe Personne</h2>
<p>Ajouter à la classe <code>Personne</code> une méthode <code>seDecrire()</code> qui retourne une chaîne du type :</br>
"Je m'appelle Marie et j'ai 25 ans".</br>
Appeler cette méthode sur l'objet <code>p</code> et afficher le résultat.</p>

<p><strong>Résultat Exercice 2 :</strong></p>
<p><%= p.seDecrire() %></p>

<h2>Exercice 3 : La classe Rectangle</h2>
<p>Créer une classe <code>Rectangle</code> avec les attributs <code>longueur</code> et <code>largeur</code>.</br>
Ajouter une méthode <code>calculerSurface()</code> qui retourne la surface du rectangle.</br>
Créer un rectangle de 5 par 3 et afficher sa surface.</p>

<%-- STEP 3: Call and display your external Rectangle class here --%>
<%
    // Instantiating the external Rectangle object
    Rectangle monRectangle = new Rectangle(5, 3);
%>
<p><strong>Résultat Exercice 3 :</strong></p>
<ul>
    <li>Longueur : <%= monRectangle.longueur %></li>
    <li>Largeur : <%= monRectangle.largeur %></li>
    <li>Surface : <%= monRectangle.calculerSurface() %> m²</li>
</ul>

<h2>Exercice 4 : Le compte bancaire</h2>
<p>Créer une classe <code>CompteBancaire</code> avec un attribut <code>solde</code>.</br>
Ajouter deux méthodes : <code>deposer(double montant)</code> et <code>retirer(double montant)</code>.</br>
Créer un compte, déposer 100€, retirer 30€, puis afficher le solde final.</p>

<%-- Initialize the bank account using session to persist data --%>
<%
    // Get or create the CompteBancaire object in session
    CompteBancaire compte = (CompteBancaire) session.getAttribute("compte");
    if (compte == null) {
        compte = new CompteBancaire();
        session.setAttribute("compte", compte);
    }
    
    // Check which action was performed
    String action = request.getParameter("action");
    String montantStr = request.getParameter("montant");
    
    if (action != null && montantStr != null && !montantStr.isEmpty()) {
        try {
            double montant = Double.parseDouble(montantStr);
            if ("deposer".equals(action)) {
                compte.deposer(montant);
            } else if ("retirer".equals(action)) {
                compte.retirer(montant);
            }
            // Update session with new solde
            session.setAttribute("compte", compte);
        } catch (NumberFormatException e) {
            // Invalid number format
        }
    }
%>

<form action="#" method="post">
    <p>Montant (€) : <input type="number" name="montant" step="0.01" min="0" required>
    <button type="submit" name="action" value="deposer">Déposer</button>
    <button type="submit" name="action" value="retirer">Retirer</button>
    </p>
</form>

<p><strong>Résultat Exercice 4 :</strong></p>
<p>Solde actuel : <strong><%= String.format("%.2f", compte.solde) %> €</strong></p>

<h2>Exercice 5 : L'encapsulation</h2>
<p>Modifier la classe <code>Personne</code> pour rendre les attributs <code>privés</code>.</br>
Ajouter les getters et setters correspondants : <code>getNom()</code>, <code>setNom(...)</code>, <code>getAge()</code>, <code>setAge(...)</code>.</br>
Adapter ensuite le code de la page pour utiliser ces accesseurs au lieu d'accéder directement aux attributs.</p>

<% } %>
<p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
