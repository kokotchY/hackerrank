package arrays;

import java.util.Scanner;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] res = new int[n];
        for (int i = 0; i < n; i++) {
            res[i] = scanner.nextInt();
        }

        for (int i = n - 1; i > 0; i--) {
            System.out.print(res[i]+" ");
        }
        System.out.println(res[0]);
    }
}
