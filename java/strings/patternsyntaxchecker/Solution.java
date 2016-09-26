package strings.patternsyntaxchecker;

import java.util.Scanner;
import java.util.regex.Pattern;

/**
 * Created by kokotchy on 9/26/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int testCases = in.nextInt();
        in.nextLine();
        while (testCases > 0) {
            String str = in.nextLine();
            try {
                Pattern pattern = Pattern.compile(str);
                System.out.println("Valid");
            } catch (Exception e) {
                System.out.println("Invalid");
            }
            testCases--;
        }
    }
}
