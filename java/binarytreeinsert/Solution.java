package binarytreeinsert;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Node d = new Node(1);
        Node e = new Node(3);
        Node f = new Node(6);
        Node b = new Node(2, d, e);
        Node c = new Node(7);
        Node a = new Node(4, b, c);
        Node result = Insert(a, 6);
        display(result);
    }

    private static void display(Node result) {
        if (result != null) {
            System.out.print(result.data+ " ");
            display(result.left);
            display(result.right);
        }
    }

    private static Node Insert(Node node, int value) {
        if (node == null) {
            return new Node(value);
        }

        if (value < node.data) {
            node.left = Insert(node.left, value);
        } else if (value > node.data) {
            node.right = Insert(node.right, value);
        }

        return node;
    }
}
