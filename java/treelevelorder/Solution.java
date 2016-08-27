package treelevelorder;

import java.util.ArrayDeque;
import java.util.Deque;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Node d = new Node(1);
        Node e = new Node(4);
        Node f = new Node(6);
        Node b = new Node(5, d, e);
        Node c = new Node(2, f, null);
        Node a = new Node(3, b, c);
        LevelOrder(a);
    }

    private static void LevelOrder(Node root) {
        Deque<Node> nodes = new ArrayDeque<>();
        if (root != null) {
            nodes.add(root);
        }
        for (; !nodes.isEmpty(); nodes.pop()) {
            Node first = nodes.getFirst();
            System.out.print(first.data + " ");
            if (first.left != null) {
                nodes.add(first.left);
            }
            if (first.right != null) {
                nodes.add(first.right);
            }
        }
    }
}
