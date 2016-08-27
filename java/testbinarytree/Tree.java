package testbinarytree;

import java.util.Scanner;
import java.util.Vector;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Tree {
    Vector<Integer> values;
    private int count;

    Tree() {
        this.values = new Vector<>();
        this.count = 0;
    }

    static class Res {
        int max;
        boolean valid;

        Res() {
            max = -1;
            valid = false;
        }
    }

    static class Node {
        int data;
        Node left, right;

        Node(int data) {
            this.data = data;
        }

        Node() {
            this.data = -1;
            this.left = null;
            this.right = null;
        }
    }

    boolean checkBST(Node root) {
        if (root == null) {
           return true;
        }

        if (root.left != null && root.left.data > root.data) {
           return false;
        }

        return !(root.right != null && root.right.data < root.data);
    }

    void inOrder(Node root, int levels) {
        if (root != null) {
            if (levels > 0) {
                root.left = new Node();
                inOrder(root.left, levels-1);
            }

            root.data = values.elementAt(count);
            count++;

            if (levels > 0) {
                root.right = new Node();
                inOrder(root.right, levels-1);
            }
        }
    }

    public static void main(String[] args) {
//        Scanner scanner = new Scanner(System.in);
//        int height = scanner.nextInt();
//
//        Tree tree = new Tree();
//        while (scanner.hasNext()) {
//            tree.values.add(scanner.nextInt());
//        }
//        scanner.close();
//
//        Node root = new Node();
//        tree.inOrder(root, height);

        Node d = new Node(1);
        Node e = new Node(4);
        Tree tree = new Tree();
        Node f = new Node(6);
        Node b = new Node(5);
        b.left = d;
        b.right = e;
        Node c = new Node(2);
        c.left = f;
        Node root = new Node(3);
        root.right = c;
        root.left = b;
        System.out.println(tree.checkBST(root) ? "Yes" : "No");
    }
}
