package exercice;

public class Produit {
    public double prix;

    // Constructeur with price validation (Exercice 5)
    public Produit(double prix) {
        if (prix < 0) {
            this.prix = 0;
        } else {
            this.prix = prix;
        }
    }
}
