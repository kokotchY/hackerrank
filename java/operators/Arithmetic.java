package operators;

import java.util.Scanner;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Arithmetic {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        double mealCost = scan.nextDouble();
        int tipPercent = scan.nextInt();
        int taxPercent = scan.nextInt();
        scan.close();

        double tip = mealCost * (tipPercent / 100.0);
        double tax = mealCost * (taxPercent / 100.0);

        int totalCost = (int) Math.round(mealCost + tip + tax);
        System.out.println("The total meal cost is "+totalCost+" dollars.");
    }
}
