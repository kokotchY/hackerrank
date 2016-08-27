package treehuffmandecode;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Node {
    public int frequency;
    public char data;
    public Node left, right;

    public Node() {
    }

    public Node(int frequency, char data, Node left, Node right) {
        this.frequency = frequency;
        this.data = data;
        this.left = left;
        this.right = right;
    }
}
