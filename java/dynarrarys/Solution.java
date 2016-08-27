package dynarrarys;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);

        int n = in.nextInt();
        int nbQ = in.nextInt();
        int lastAns = 0;
        List<List<Integer>> seqList = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            seqList.add(i, new ArrayList<>());
        }
        for (int i = 0; i < nbQ; i++) {
            int qType = in.nextInt();
            int x = in.nextInt();
            int y = in.nextInt();
            int seqIdx = (x^lastAns) % n;
            List<Integer> list = seqList.get(seqIdx);
            if (qType == 1) {
                list.add(y);
            } else if (qType == 2) {
                lastAns = list.get(y % list.size());
                System.out.println(lastAns);
            }
        }
    }
}
