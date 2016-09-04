package sorting;

import java.util.Scanner;

/**
 * Created by kokotchy on 9/4/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        int a[] = new int[n];
        for (int a_i = 0; a_i < n; a_i++) {
            a[a_i] = in.nextInt();
        }

        int res = bubbleSort(a, n);
        System.out.println("Array is sorted in " + res + " swaps.");
        System.out.println("First Element: " + a[0]);
        System.out.println("Last Element: "+ a[n-1]);
    }

    private static int bubbleSort(int[] a, int n) {
        int totalNumberOfSwaps = 0;
        for (int i = 0; i < n; i++) {
            int numberOfSwaps = 0;
            for (int j = 0; j < n - 1; j++) {
                if (a[j] > a[j + 1]) {
                    int tmp = a[j];
                    a[j] = a[j+1];
                    a[j+1] = tmp;
                    numberOfSwaps++;
                }
            }

            totalNumberOfSwaps += numberOfSwaps;

            if (numberOfSwaps == 0) {
                break;
            }
        }

        return totalNumberOfSwaps;
    }
}
