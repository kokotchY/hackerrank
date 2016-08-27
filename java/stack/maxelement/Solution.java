package stack.maxelement;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Objects;
import java.util.Scanner;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Deque<Integer> stack = new ArrayDeque<>();
        Deque<Integer> max = new ArrayDeque<>();

        int n = scanner.nextInt();
        for (int i = 0; i < n; i++) {
            int nb = scanner.nextInt();
            switch (nb) {
                case 1:
                    int x = scanner.nextInt();
                    stack.addFirst(x);
                    if (!max.isEmpty()) {
                        if (x > max.getFirst()) {
                            max.addFirst(x);
                        }
                    } else {
                        max.addFirst(x);
                    }
                    break;
                case 2:
                    if (!max.isEmpty() && Objects.equals(stack.getFirst(), max.getFirst())) {
                        max.removeFirst();
                    }
                    stack.removeFirst();
                    break;
                case 3:
                    System.out.println(max.getFirst());
                    break;
            }
        }

        scanner.close();
    }
}
