package balancedbrackets;

import java.util.*;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int t = in.nextInt();
        for (int a0 = 0; a0 < t; a0++) {
            String s = in.next();
            if (isBalanced(s)) {
                System.out.println("YES");
            } else {
                System.out.println("NO");
            }
        }
    }

    private static boolean isBalanced(String s) {
        Deque<Character> stack = new ArrayDeque<>();
        int length = s.length();
        for (int i = 0; i < length; i++) {
            char chr = s.charAt(i);
            if (isOpen(chr)) {
                stack.addFirst(chr);
            } else {
                if (!stack.isEmpty()) {
                    Character top = stack.removeFirst();
                    if (!isMatch(top, chr)) {
                        return false;
                    }
                } else {
                    return false;
                }
            }
        }
        return stack.isEmpty();
    }

    private static boolean isMatch(char open, char close) {
        switch (open) {
            case '(':
                return close == ')';
            case '[':
                return close == ']';
            case '{':
                return close == '}';
            default:
                return false;
        }
    }

    private static boolean isOpen(char chr) {
        return chr == '(' || chr == '[' || chr == '{';
    }
}
