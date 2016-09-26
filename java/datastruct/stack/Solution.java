package datastruct.stack;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Scanner;

/**
 * Created by kokotchy on 9/26/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        while (sc.hasNext()) {
            String input = sc.next();
            if (isValid(input)) {
                System.out.println("true");
            } else {
                System.out.println("false");
            }
        }
    }

    private static boolean isValid(String str) {
        Deque<Character> deque = new ArrayDeque<>();
        for (int i = 0; i < str.length(); i++) {
            char c = str.charAt(i);
            switch (c) {
                case '(':
                case '[':
                case '{':
                    deque.add(c);
                    break;
                case ')':
                    if (deque.isEmpty()) {
                        return false;
                    } else if (deque.removeLast() != '(') {
                        return false;
                    }
                    break;
                case ']':
                    if (deque.isEmpty()) {
                        return false;
                    } else if (deque.removeLast() != '[') {
                        return false;
                    }
                    break;
                case '}':
                    if (deque.isEmpty()) {
                        return false;
                    } else if (deque.removeLast() != '{') {
                        return false;
                    }
                    break;
            }
        }
        return deque.isEmpty();
    }
}
