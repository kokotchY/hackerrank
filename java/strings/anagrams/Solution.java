package strings.anagrams;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;

/**
 * Created by kokotchy on 9/26/16.
 */
public class Solution {

    static boolean isAnagram(String a, String b) {
        List<Character> lettersA = getSortedLetters(a);
        List<Character> lettersB = getSortedLetters(b);
        return lettersA.equals(lettersB);
    }

    private static List<Character> getSortedLetters(String str) {
        String str2 = str.toLowerCase();
        List<Character> list = new ArrayList<>();
        for (int i = 0; i < str2.length(); i++) {
            list.add(str2.charAt(i));
        }
        Collections.sort(list);
        return list;
    }

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String a = scan.next();
        String b = scan.next();
        scan.close();
        boolean ret = isAnagram(a, b);
        System.out.println(ret?"Anagrams":"Not Anagrams");
    }
}
