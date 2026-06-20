package exercice;

public class CompteBancaire {
    public double solde;

    // Constructor - starts with solde at zero
    public CompteBancaire() {
        this.solde = 0.0;
    }

    // Method to deposit money
    public void deposer(double montant) {
        if (montant > 0) {
            solde += montant;
        }
    }

    // Method to withdraw money
    public void retirer(double montant) {
        if (montant > 0 && montant <= solde) {
            solde -= montant;
        }
    }
}
