package binarysearchtree;

/**
 * Created by kokotchy on 9/6/16.
 */
public class Node {
    Node left, right;
    int data;

    Node(int data) {
        this.data = data;
        left = right = null;
    }
}
