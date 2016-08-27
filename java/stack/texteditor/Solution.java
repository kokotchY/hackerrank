package stack.texteditor;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Scanner;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int q = scanner.nextInt();
        Deque<String> editor = new ArrayDeque<>();
        editor.add("");
        for (int i = 0; i < q; i++) {
            int op = scanner.nextInt();
            switch (op) {
                case 1:
                    editor.add(editor.getLast() + scanner.nextLine().trim());
                    break;
                case 2:
                    int posRemove = scanner.nextInt();
                    String last = editor.getLast();
                    editor.add(removeLastChar(last, posRemove));
                    break;
                case 3:
                    int posDisplay = scanner.nextInt()-1;
                    System.out.println(editor.getLast().charAt(posDisplay));
                    break;
                case 4:
                    editor.removeLast();
                    break;
            }
        }
        scanner.close();
    }

    private static String removeLastChar(String line, int k) {
        return line.substring(0, line.length()-k);
    }
}
