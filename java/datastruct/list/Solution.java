package datastruct.list;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * Created by kokotchy on 9/26/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<Integer> list = new ArrayList<>();
        int n = scanner.nextInt();
        for (int i = 0; i < n; i++) {
            list.add(scanner.nextInt());
        }

        int q = scanner.nextInt();
        scanner.nextLine();
        for (int i = 0; i < q; i++) {
            String query = scanner.nextLine();
            if ("Insert".equals(query)) {
                int x = scanner.nextInt();
                int y = scanner.nextInt();
                if (scanner.hasNextLine()) {
                    scanner.nextLine();
                }
                list.add(x, y);
            } else if ("Delete".equals(query)) {
                int x = scanner.nextInt();
                list.remove(x);
                if (scanner.hasNextLine()) {
                    scanner.nextLine();
                }
            }
        }
        for (Integer i : list) {
            System.out.print(i + " ");
        }
        System.out.println();
    }
}
