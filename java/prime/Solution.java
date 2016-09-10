package prime;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * Created by kokotchy on 9/9/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int nb = scanner.nextInt();
        List<Integer> list = new ArrayList<>();
        while (nb-- > 0) {
            list.add(scanner.nextInt());
        }

        for (Integer integer : list) {
            if (isPrime(integer)) {
                System.out.println("Prime");
            } else {
                System.out.println("Not prime");
            }
        }
    }

    private static boolean isPrime(Integer integer) {
        if (integer == 1) {
            return false;
        }
        for (int i = 2; i < Math.sqrt(integer); i++) {
            if (integer % i == 0) {
                return false;
            }
        }
        return true;
    }
}
