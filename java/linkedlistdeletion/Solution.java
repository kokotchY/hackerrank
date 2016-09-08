package linkedlistdeletion;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.Scanner;

/**
 * Created by kokotchy on 9/8/16.
 */
public class Solution {
    public static Node removeDuplicates(Node head) {
        if (head == null) {
            return null;
        }

        Deque<Integer> values = new ArrayDeque<>();
        values.add(head.data);
        Node prev = head;
        Node cur = head.next;
        while (cur != null) {
            int data = cur.data;
            if (values.contains(data)) {
                prev.next = cur.next;
            } else {
                values.add(data);
                prev = cur;
            }
            cur = cur.next;
        }
        return head;
    }

    public static Node insert(Node head, int data) {
        Node p = new Node(data);
        if (head == null) {
            head = p;
        } else if (head.next == null) {
            head.next = p;
        } else {
            Node start = head;
            while (start.next != null) {
                start = start.next;
            }
            start.next = p;
        }
        return head;
    }

    public static void display(Node head) {
        Node start = head;
        while (start != null) {
            System.out.print(start.data + " ");
            start = start.next;
        }
    }

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Node head = null;
        int T = sc.nextInt();
        while (T-- > 0) {
            int ele = sc.nextInt();
            head = insert(head, ele);
        }
        head = removeDuplicates(head);
        display(head);
    }
}
