package abstractclass;

import javax.xml.bind.PrintConversionEvent;
import java.util.Scanner;

/**
 * Created by kokotchy on 8/28/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        String title = sc.nextLine();
        String author = sc.nextLine();
        int price = sc.nextInt();
        Book newNovel = new MyBook(title, author, price);
        newNovel.display();
    }
}
