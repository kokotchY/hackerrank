package datastruct.phonebook;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 * Created by kokotchy on 9/26/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        in.nextLine();
        Map<String, Integer> contacts = new HashMap<>();
        for (int i = 0; i < n; i++) {
            String name = in.nextLine();
            int phone = in.nextInt();
            in.nextLine();
            contacts.put(name, phone);
        }

        while (in.hasNext()) {
            String s = in.nextLine();
            if (contacts.containsKey(s)) {
                System.out.println(s + "=" + contacts.get(s));
            } else {
                System.out.println("Not found");
            }
        }
    }
}
