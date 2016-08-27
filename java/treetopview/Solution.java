package treetopview;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Node h = new Node(9, null, null);
        Node i = new Node(8, null, null);

        Node g = new Node(7, i, null);
        Node f = new Node(6, null, null);
        Node e = new Node(4, null, null);
        Node d = new Node(1, null, h);
        Node c = new Node(2, f, g);
        Node b = new Node(5, d, e);
        Node a = new Node(3, b, c);

        topView(a);
    }

    private static void topView(Node root) {
        display_left(root.left);
        System.out.print(root.data + " ");
        display_right(root.right);
    }

    private static void display_right(Node node) {
        if (node != null) {
            System.out.print(node.data + " ");
        }

        if (node.right != null) {
            display_right(node.right);
        }
    }

    private static void display_left(Node node) {
        if (node.left != null) {
            display_left(node.left);
        }

        if (node != null) {
            System.out.print(node.data+" ");
        }
    }
}
