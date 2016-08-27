package stack.equalstacks;

import java.util.*;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        int n1 = scanner.nextInt();
        int n2 = scanner.nextInt();
        int n3 = scanner.nextInt();
        Deque<StackInfo> stack1 = loadStack(scanner, n1);
        Deque<StackInfo> stack2 = loadStack(scanner, n2);
        Deque<StackInfo> stack3 = loadStack(scanner, n3);

        List<Deque<StackInfo>> list = new ArrayList<>();
        list.add(stack1);
        list.add(stack2);
        list.add(stack3);
        int max = getMaxStackInfo(list);
        System.out.println(max);
    }

    private static int getMaxStackInfo(List<Deque<StackInfo>> list) {
        int firstMaxSize = list.get(0).getLast().maxSize;
        int maxSize = firstMaxSize;
        List<Deque<StackInfo>> stackMaxSizes = new ArrayList<>();
        boolean same = true;
        for (Deque<StackInfo> infos : list) {
            int currentMaxSize = infos.getLast().maxSize;
            if (currentMaxSize != firstMaxSize) {
                same = false;
                if (currentMaxSize == maxSize) {
                    stackMaxSizes.add(infos);
                } else if (currentMaxSize > maxSize) {
                    stackMaxSizes = new ArrayList<>();
                    stackMaxSizes.add(infos);
                    maxSize = currentMaxSize;
                }
            }
        }

        System.out.println("#Stack: " + stackMaxSizes.size());
        for (Deque<StackInfo> stackMaxSize : stackMaxSizes) {
            stackMaxSize.removeLast();
        }

        if (same) {
            return firstMaxSize;
        } else {
            return getMaxStackInfo(list);
        }
    }

    private static Deque<StackInfo> loadStack(Scanner scanner, int nb) {
        Deque<StackInfo> result = new ArrayDeque<>();
        int[] heights = new int[nb];
        for (int i = 0; i < nb; i++) {
            heights[i] = scanner.nextInt();
        }

        int maxSize = 0;
        for (int i = nb - 1; i >= 0; i--) {
            int height = heights[i];
            maxSize += height;
            result.add(new StackInfo(height, maxSize));
        }
        return result;
    }
}
