package treehuffmandecode;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Solution {
    public static void main(String[] args) {
        Node n2 = new Node(3, 'A', null, null);
        Node n5 = new Node(1, 'C', null, null);
        Node n4 = new Node(1, 'B', null, null);
        Node n1 = new Node(2, 'z', n4, n5);
        Node root = new Node(5, 'z', n1, n2);
        decode("1001011", root);
    }

    static void decode(String S, Node root) {
        StringBuilder result = new StringBuilder();
        int idx = 0;
        int length = S.length();
        Node node = root;
        while (idx < length) {
            if (S.charAt(idx) == '1') {
                node = node.right;
            } else {
                node = node.left;
            }

            if (node.left == null && node.right == null) {
                // leaf
                result.append(node.data);
                node = root;
            }
            idx++;
        }

        System.out.println(result.toString());
    }
}
