package exercice;

public class Etudiant {
    public String nom;
    public double note;

    // Constructeur par défaut (Exercice 1 & 3)
    public Etudiant() {
        this("Anonyme", 10);
    }

    // Constructeur avec nom uniquement (Exercice 2)
    public Etudiant(String nom) {
        this(nom, 10);
    }

    // Constructeur avec nom et note (Exercice 2)
    public Etudiant(String nom, double note) {
        this.nom = nom;
        this.note = note;
    }

    // Constructeur de copie (Exercice 4)
    public Etudiant(Etudiant autre) {
        this.nom = autre.nom;
        this.note = autre.note;
    }
}
