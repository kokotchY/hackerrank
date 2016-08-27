package largestrectangle;

import java.util.Scanner;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int n = scanner.nextInt();
        int[] list = new int[n];
        for (int i = 0; i < n; i++) {
            list[i] = scanner.nextInt();
        }

        int maxArea = Integer.MIN_VALUE;
        for (int i = 0; i < n-1; i++) {
            for (int j = i + 1; j < n; j++) {
                int min = getMin(list, i, j);
                int area = min * (j - i + 1);
                if (area > maxArea) {
                    maxArea = area;
                }
            }
        }

        System.out.println(maxArea);
    }

    private static int getMin(int[] list, int start, int end) {
        int min = Integer.MAX_VALUE;
        for (int i = start; i <= end; i++) {
            if (list[i] < min) {
                min = list[i];
            }
        }
        return min;
    }
}
