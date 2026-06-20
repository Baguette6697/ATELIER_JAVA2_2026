package exercice;

public class Rectangle {
    public double longueur;
    public double largeur;

    // Constructor
    public Rectangle(double longueur, double largeur) {
        this.longueur = longueur;
        this.largeur = largeur;
    }

    // Method to calculate surface area
    public double calculerSurface() {
        return longueur * largeur;
    }
}
