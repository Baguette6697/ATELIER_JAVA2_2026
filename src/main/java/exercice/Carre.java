package exercice;

public class Carre extends Forme {
    public double cote;

    public Carre(double cote) {
        this.cote = cote;
    }

    @Override
    public double aire() {
        return cote * cote;
    }
}
