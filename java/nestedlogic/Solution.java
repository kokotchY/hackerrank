package nestedlogic;

import java.util.Scanner;

/**
 * Created by kokotchy on 9/10/16.
 */
public class Solution {
    private static int calcFine(int retDay, int retMonth, int retYear, int expDay, int expMonth, int expYear) {
        if (retYear < expYear) {
            return 0;
        } else if (retYear == expYear) {
            if (retMonth <= expMonth && retDay <= expDay) {
                return 0;
            } else if (retMonth <= expMonth) {
                return 15 * Math.abs(expDay - retDay);
            } else {
                return 500 * Math.abs(expMonth - retMonth);
            }
        } else {
            return 10000;
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int retDay = scanner.nextInt();
        int retMonth = scanner.nextInt();
        int retYear = scanner.nextInt();

        int expDay = scanner.nextInt();
        int expMonth = scanner.nextInt();
        int expYear = scanner.nextInt();

        scanner.close();
        System.out.println(calcFine(retDay, retMonth, retYear, expDay, expMonth, expYear));
    }
}