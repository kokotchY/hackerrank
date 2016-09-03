package excpt;

import java.util.Scanner;

/**
 * Created by kokotchy on 9/3/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        String s = in.next();
        try {
            int value = Integer.parseInt(s);
            System.out.println(value);
        } catch (NumberFormatException e) {
            System.out.println("Bad String");
        }
    }
}
