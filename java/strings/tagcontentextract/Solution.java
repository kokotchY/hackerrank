package strings.tagcontentextract;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by kokotchy on 9/26/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int testCases = Integer.parseInt(in.nextLine());
        while (testCases > 0) {
            String line = in.nextLine();
            String strPattern = "<(.+?)>([^<>]+)</\\1>";
            Pattern pattern = Pattern.compile(strPattern);
            Matcher m = pattern.matcher(line);
            int count = 0;
            while (m.find()) {
                if (m.group(2).length() != 0) {
                    System.out.println(m.group(2));
                    count++;
                }
            }
            if (count == 0) {
                System.out.println("None");
            }
            testCases--;
        }
    }
}
