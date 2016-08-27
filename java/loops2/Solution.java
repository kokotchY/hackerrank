package loops2;

import java.util.Scanner;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int t = scanner.nextInt();
        scanner.nextLine();
        for (int i = 0; i < t; i++) {
            String line = scanner.nextLine();
            StringBuilder even = new StringBuilder();
            StringBuilder odd = new StringBuilder();
            int length = line.length();
            for (int j = 0; j < length; j++) {
                if (j % 2 == 0) {
                    even.append(line.charAt(j));
                } else {
                    odd.append(line.charAt(j));
                }
            }
            System.out.print(even.toString()+" "+odd.toString());
        }
    }
}
