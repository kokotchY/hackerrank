package bintreelowestancestory;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Node {
    public int data;
    public Node left, right;

    public Node(int data) {
        this.data = data;
    }

    public Node(int data, Node left, Node right) {
        this.data = data;
        this.left = left;
        this.right = right;
    }
}
