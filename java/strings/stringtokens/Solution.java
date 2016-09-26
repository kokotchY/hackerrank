package strings.stringtokens;

import java.util.Scanner;

/**
 * Created by kokotchy on 9/26/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String s = scan.nextLine().trim();
        scan.close();
        if (s.length() == 0) {
            System.out.println(0);
        } else {
            String[] split = s.split("[ !,?._'@]+");
            System.out.println(split.length);
            for (String str : split) {
                System.out.println(str);
            }
        }
    }
}
