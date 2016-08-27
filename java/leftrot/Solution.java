package leftrot;

import java.util.Scanner;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int d = scanner.nextInt();
        int[] list = new int[n];
        for (int i = 0; i < n; i++) {
            list[(i + n - d) % n] = scanner.nextInt();
        }

        for (int i = 0; i < n - 1; i++) {
            System.out.print(list[i]+" ");
        }
        System.out.println(list[n-1]);
    }

    private static int[] leftRotation(int[] list) {
        int length = list.length;
        int[] res = new int[length];
        for (int i = 1; i < length; i++) {
            res[i-1] = list[i];
        }
        res[length-1] = list[0];
        return res.clone();
    }
}
