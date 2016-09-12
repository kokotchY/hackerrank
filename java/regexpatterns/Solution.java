package regexpatterns;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Pattern;

/**
 * Created by kokotchy on 9/12/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int N = in.nextInt();
        String pattern = "(.*)@gmail\\.com$";
        Pattern p = Pattern.compile(pattern);
        List<String> list = new ArrayList<>();
        for (int a0 = 0; a0 < N; a0++) {
            String firstName = in.next();
            String emailID = in.next();
            if (p.matcher(emailID).matches()) {
                list.add(firstName);
            }
        }

        Collections.sort(list);
        for (String s : list) {
            System.out.println(s);
        }
    }
}
