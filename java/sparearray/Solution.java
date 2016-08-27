package sparearray;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        scanner.nextLine();
        Map<String, Integer> occ = new HashMap<>();
        for (int i = 0; i < n; i++) {
            String word = scanner.nextLine();
            if (occ.containsKey(word)) {
                int value = occ.get(word);
                occ.put(word, value + 1);
            } else {
                occ.put(word, 1);
            }
        }

        int q = scanner.nextInt();
        scanner.nextLine();
        for (int i = 0; i < q; i++) {
            String word = scanner.nextLine();
            if (occ.containsKey(word)) {
                System.out.println(occ.get(word));
            } else {
                System.out.println(0);
            }
        }
    }
}
