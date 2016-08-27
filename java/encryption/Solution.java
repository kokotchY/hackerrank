package encryption;

import java.util.Map;
import java.util.Scanner;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        String sentence = in.next();
        in.close();
        int length = sentence.length();
        double sqrt = Math.sqrt(length);
        int lower = (int) Math.floor(sqrt);
        int upper = (int) Math.ceil(sqrt);

        int rows = 0;
        int cols = 0;
        int minArea = Integer.MAX_VALUE;
        for (int r = lower; r <= upper; r++) {
            for (int c = r; c <= upper; c++) {
                int area = c*r;
                if ((area >= length) && (area < minArea)) {
                    minArea = area;
                    rows = r;
                    cols = c;
                }
            }
        }

        int idx = 0;
        char[][] grid = new char[rows][cols];
        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) {
                if (idx < length) {
                    char chr = sentence.charAt(idx++);
                    grid[r][c] = chr;
                } else {
                    grid[r][c] = ' ';
                }
            }
        }

        for (int x = 0; x < cols; x++) {
            StringBuilder builder = new StringBuilder();
            for (int y = 0; y < rows; y++) {
                if (grid[y][x] != ' ') {
                    builder.append(grid[y][x]);
                }
            }
            System.out.print(builder.toString() + " ");
        }
    }
}
