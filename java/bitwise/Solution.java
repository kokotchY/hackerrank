package bitwise;

import java.util.Scanner;

/**
 * Created by kokotchy on 9/13/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int t = in.nextInt();
        for (int a0 = 0; a0 < t; a0++) {
            int n = in.nextInt();
            int k = in.nextInt();
            int max = Integer.MIN_VALUE;
            for (int i = 1; i < n; i++) {
                for (int j = i + 1; j <= n; j++) {
                    int value = i&j;
                    if (value > max && value < k) {
                        max = value;
                    }
                }
            }
            System.out.println(max);
        }
    }
}
