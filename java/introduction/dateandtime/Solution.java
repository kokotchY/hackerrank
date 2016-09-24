package introduction.dateandtime;

import java.util.Calendar;
import java.util.Locale;
import java.util.Scanner;

/**
 * Created by kokotchy on 9/24/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int month = in.nextInt();
        int day = in.nextInt();
        int year = in.nextInt();

        Calendar instance = Calendar.getInstance();
        instance.set(year, month-1, day);
        System.out.println(instance.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.LONG, Locale.getDefault()).toUpperCase());
    }
}
