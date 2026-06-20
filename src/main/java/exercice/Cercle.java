package exercice;

public class Cercle extends Forme {
    public double rayon;

    public Cercle(double rayon) {
        this.rayon = rayon;
    }

    @Override
    public double aire() {
        return Math.PI * rayon * rayon;
    }
}
