package introduction.outputformatting;

import java.util.Scanner;

/**
 * Created by kokotchy on 9/24/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("================================");
        for (int i = 0; i < 3; i++) {
            String s1 = sc.next();
            StringBuilder builder = new StringBuilder();

            int x = sc.nextInt();
            builder.append(s1);
            for (int j = s1.length(); j < 15; j++) {
                builder.append(" ");
            }

            if (x < 10) {
                builder.append("00");
            } else if (x < 100) {
                builder.append("0");
            }

            builder.append(x);
            System.out.println(builder.toString());
        }
        System.out.println("================================");
    }
}
