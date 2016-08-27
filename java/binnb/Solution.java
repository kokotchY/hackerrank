package binnb;

import java.util.Scanner;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        in.close();

        String s = Integer.toBinaryString(n);
        int max = 0;
        int cur = 0;
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '1') {
                cur++;
            } else {
                if (cur > max) {
                    max = cur;
                }
            }
        }

        if (cur > max) {
            max = cur;
        }

        System.out.println(max);
    }
}
