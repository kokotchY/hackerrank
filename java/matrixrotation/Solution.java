package matrixrotation;

import java.util.Arrays;
import java.util.Scanner;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int m = scanner.nextInt();
        int n = scanner.nextInt();
        int r = scanner.nextInt();

        int[][] grid = new int[n][m];
        for (int y = 0; y < m; y++) {
            for (int x = 0; x < n; x++) {
                grid[y][x] = scanner.nextInt();
            }
        }

        int[][] tmpGrid = grid;
        for (int i = 0; i < r; i++) {
            tmpGrid = rotate(tmpGrid, 0, n, m);
        }

        displayGrid(tmpGrid);
    }

    private static int[][] rotate(int[][] grid, int ring, int n, int m) {
        int[][] result = new int[n][m];
        for (int y = 0; y < m; y++) {
            System.out.println("Copying "+y);
            result[y] = Arrays.copyOf(grid[y], grid[y].length);
        }
        int startRingX = ring;
        int endRingX = grid[0].length - 1 - ring;
        int startRingY = ring;
        int endRingY = grid.length - 1 - ring;

        System.out.println("Before top row");
        displayGrid(grid);
        // top row
        for (int x = startRingX + 1; x <= endRingX; x++) {
            int value = grid[startRingY][x];
            if ((x - 1) < startRingX) {
                System.out.printf("Not moving %d from (%d,%d) to (%d,%d)%n", value, x, startRingY, (x - 1), startRingY);
            } else {
                result[startRingY][x - 1] = value;
                System.out.printf("Moving %d from (%d,%d) to (%d,%d)%n", value, x, startRingY, (x - 1), startRingY);
            }
        }
        System.out.println();
        System.out.println("After top row");
        displayGrid(grid);

        // bottom row
        for (int x = startRingX; x <= endRingX - 1; x++) {
            int value = grid[endRingY][x];
            if ((x + 1) > endRingX) {
                System.out.printf("Not moving %d from (%d,%d) to (%d,%d)%n", value, x, endRingY, (x + 1), endRingY);
            } else {
                result[endRingY][x + 1] = value;
                System.out.printf("Moving %d from (%d,%d) to (%d,%d)%n", value, x, endRingY, (x + 1), endRingY);
            }
        }
        System.out.println();

        // left row
        for (int y = startRingY; y <= endRingY - 1; y++) {
            int value = grid[y][startRingX];
            if ((y + 1) > endRingY) {
                System.out.printf("Not moving %d from (%d,%d) to (%d,%d)%n", value, startRingX, y, startRingX, (y + 1));
            } else {
                result[y + 1][startRingX] = value;
                System.out.printf("Moving %d from (%d,%d) to (%d,%d)%n", value, startRingX, y, startRingX, (y + 1));
            }
        }
        System.out.println();

        // right row
        for (int y = startRingY + 1; y <= endRingY; y++) {
            int value = grid[y][endRingX];
            if ((y - 1) < startRingY) {
                System.out.printf("Not moving %d from (%d,%d) to (%d,%d)%n", value, endRingX, y, endRingX, (y - 1));
            } else {
                result[y - 1][endRingX] = value;
                System.out.printf("Moving %d from (%d,%d) to (%d,%d)%n", value, endRingX, y, endRingX, (y - 1));
            }

        }
        System.out.println();

        // if another ring can be rotated
        if (false) {
            return rotate(result, ring + 1, n, m);
        }
        return result;
    }

    private static void displayGrid(int[][] grid) {
        int rows = grid.length;
        for (int y = 0; y < rows; y++) {
            int cols = grid[y].length;
            for (int x = 0; x < cols; x++) {
                System.out.print(grid[y][x]+" ");
            }
            System.out.println();
        }
    }
}
