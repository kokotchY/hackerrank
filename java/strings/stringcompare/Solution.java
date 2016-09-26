package strings.stringcompare;

import java.util.Scanner;

/**
 * Created by kokotchy on 9/26/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String line = scanner.nextLine();
        int size = scanner.nextInt();
        scanner.close();

        String min = line.substring(0, size);
        String max = line.substring(0, size);

        for (int i = 1; i < line.length() - size + 1; i++) {
            String cur = line.substring(i, i + size);
            if (cur.compareTo(min) < 0) {
                min = cur;
            }

            if (cur.compareTo(max) > 0) {
                max = cur;
            }
        }

        System.out.println(min);
        System.out.println(max);
    }
}
