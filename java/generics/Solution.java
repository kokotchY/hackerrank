package generics;

/**
 * Created by kokotchy on 9/5/16.
 */
public class Solution {

    public static void main(String[] args) {
        Integer[] intArray = {1,2,3};
        String[] stringArray = { "Hello", "World"};

        printArray(intArray);
        printArray(stringArray);

        if (Solution.class.getDeclaredMethods().length > 2) {
            System.out.println("You should only have 1 method named printArray.");
        }
    }

    public static <T> void printArray(T[] array) {
        for (T t : array) {
            System.out.println(t);
        }
    }

}
