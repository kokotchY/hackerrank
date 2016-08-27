package stack.poisonousplants;

import java.util.*;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        List<Integer> p = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            p.add(scanner.nextInt());
        }
        scanner.close();

        int nb = n;
        int prev = nb;
        List<Integer> toRemove = new ArrayList<>();
        do {
            prev = p.size();

            for (int i = 1; i < p.size(); i++) {
                System.out.println("Compare "+p.get(i) + " and " + p.get(i-1));
                if (p.get(i) > p.get(i - 1)) {
                    //die
                    toRemove.add(i);
                    System.out.println("Kill " + i);
                }
            }

            for (int i = toRemove.size() - 1; i >= 0; i--) {
                p.remove(i);
            }

            nb = p.size();
        } while (prev != nb);
    }
}
