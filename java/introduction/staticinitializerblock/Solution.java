package introduction.staticinitializerblock;

import java.util.Scanner;

/**
 * Created by kokotchy on 9/24/16.
 */
public class Solution {
    private static int B;
    private static int H;
    private static boolean flag;

    static {
        Scanner scanner = new Scanner(System.in);
        B = scanner.nextInt();
        H = scanner.nextInt();
        flag = B > 0 && H > 0;
        if (!flag) {
            System.out.println("java.lang.Exception: Breadth and height must be positive");
        }
    }

    public static void main(String[] args) {
        if (flag) {
            int area = B * H;
            System.out.println(area);
        }
    }
}
