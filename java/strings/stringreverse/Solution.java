package strings.stringreverse;

import java.util.Scanner;

/**
 * Created by kokotchy on 9/26/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String A = sc.next();
        sc.close();
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < A.length(); i++) {
            builder.append(A.charAt(A.length()-i-1));
        }

        if (builder.toString().equals(A)) {
            System.out.println("Yes");
        } else {
            System.out.println("No");
        }
    }
}
