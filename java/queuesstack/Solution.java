package queuesstack;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Scanner;

/**
 * Created by kokotchy on 9/3/16.
 */
public class Solution {
    private Deque<Character> queue = new ArrayDeque<>();
    private Deque<Character> stack = new ArrayDeque<>();

    private char dequeueCharacter() {
        return queue.remove();
    }

    private char popCharacter() {
        return stack.removeFirst();
    }

    private void enqueueCharacter(char c) {
        queue.add(c);
    }

    private void pushCharacter(char c) {
        stack.addFirst(c);
    }

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String input = scan.nextLine();
        scan.close();

        char[] s = input.toCharArray();

        Solution p = new Solution();

        for (char c : s) {
            p.pushCharacter(c);
            p.enqueueCharacter(c);
        }

        boolean isPalindrome = true;
        for (int i = 0; i < s.length / 2; i++) {
            if (p.popCharacter() != p.dequeueCharacter()) {
                isPalindrome = false;
                break;
            }
        }

        System.out.println("The word, " + input + ", is " + ((!isPalindrome)?"not a palindrome.":"a palindrome"));
    }
}
