package scope;

/**
 * Created by kokotchy on 9/3/16.
 */
public class Difference {
    private int[] elements;
    public int maximumDifference;

    public Difference(int[] elements) {
        this.elements = elements;
    }

    public void computeDifference() {
        for (int i = 0; i < elements.length; i++) {
            for (int j = i + 1; j < elements.length; j++) {
                int elem1 = elements[i];
                int elem2 = elements[j];
                int abs = Math.abs(elem1 - elem2);
                if (abs > maximumDifference) {
                    maximumDifference = abs;
                }
            }
        }
    }
}
