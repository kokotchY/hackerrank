package arrays2d;

import java.util.Scanner;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int[][] grid = new int[6][6];
        for (int x = 0; x < 6; x++) {
            for (int y = 0; y < 6; y++) {
                grid[y][x] = in.nextInt();
            }
        }
        in.close();

        int max = Integer.MIN_VALUE;
        for (int x = 0; x <= 3; x++) {
            for (int y = 0; y <= 3; y++) {
                int sum = grid[x][y] + grid[x + 1][y] + grid[x + 2][y]
                        + grid[x + 1][y + 1]
                        + grid[x][y + 2] + grid[x + 1][y + 2] + grid[x + 2][y + 2];
                if (sum > max) {
                    max = sum;
                }
            }
        }

        System.out.println(max);
    }
}
