package loops;

import java.util.Scanner;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        scanner.close();

        for (int i = 1; i <= 10; i++) {
            System.out.println(n + " x "+i+" = " + (n*i));
        }
    }
}
