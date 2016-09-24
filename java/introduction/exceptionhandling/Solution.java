package introduction.exceptionhandling;

import java.util.Scanner;

/**
 * Created by kokotchy on 9/24/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        while (in.hasNextInt()) {
            int n = in.nextInt();
            int p = in.nextInt();
            MyCalculator my_calculator = new MyCalculator();
            try {
                System.out.println(my_calculator.power(n,p));
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }
}

class MyCalculator {
    public int power(int n, int p) throws Exception {
        if (n < 0 || p < 0) {
            throw new Exception("n and p should be non-negative");
        }

        return (int) Math.pow(n, p);
    }
}