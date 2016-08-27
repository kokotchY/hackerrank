package bintreelowestancestory;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Node d = new Node(1);
        Node e = new Node(3);
        Node f = new Node(6);
        Node c = new Node(7, f, null);
        Node b = new Node(2, d, e);
        Node a = new Node(4, b, c);

        Node common = lca(a, 6, 4);
        System.out.println(common.data);
    }

    private static Node lca(Node root, int v1, int v2) {
        if (v1 > v2) {
            return lca(root, v2, v1);
        }
        if (v2 < root.data) {
            return lca(root.left, v1, v2);
        } else if (v1 > root.data) {
            return lca(root.right, v1, v2);
        }
        return root;
    }
}
