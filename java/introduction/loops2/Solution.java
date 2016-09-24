package introduction.loops2;

import java.util.Scanner;

/**
 * Created by kokotchy on 9/24/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int t = in.nextInt();
        for (int i = 0; i < t; i++) {
            int a = in.nextInt();
            int b = in.nextInt();
            int n = in.nextInt();
            int prev = a;
            for (int j = 0; j < n; j++) {
                prev += pow(j) *b;
                System.out.print(prev + " ");
            }
            System.out.println();
        }
        in.close();
    }

    private static int pow(int j) {
        return (int)Math.pow(2, j);
    }

}
