package introduction.endoffile;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * Created by kokotchy on 9/24/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<String> list = new ArrayList<>();
        while (scanner.hasNext()) {
            list.add(scanner.nextLine());
        }

        int i = 1;
        for (String s : list) {
            System.out.printf("%d %s%n", i, s);
            i += 1;
        }
    }
}
