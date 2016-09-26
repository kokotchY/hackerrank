package datastruct.sort;

import java.util.*;

/**
 * Created by kokotchy on 9/26/16.
 */
class Student implements Comparable<Student> {

    private final int id;
    private final String fname;
    private final double cgpa;

    public Student(int id, String fname, double cgpa) {

        this.id = id;
        this.fname = fname;
        this.cgpa = cgpa;
    }

    public int getId() {
        return id;
    }

    public String getFname() {
        return fname;
    }

    public double getCgpa() {
        return cgpa;
    }

    @Override
    public int compareTo(Student student) {
        if (this.cgpa == student.cgpa) {
            if (this.fname.equals(student.fname)) {
                if (this.id < student.id) {
                    return -1;
                } else {
                    return 1;
                }
            } else {
                return this.fname.compareTo(student.fname);
            }
        } else {
            if (this.cgpa < student.cgpa) {
                return 1;
            } else {
                return -1;
            }
        }
    }
}


public class Solution {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        int testCases = Integer.parseInt(in.nextLine());

        List<Student> studentList = new ArrayList<>();
        while (testCases > 0) {
            int id = in.nextInt();
            String fname = in.next();
            double cgpa = in.nextDouble();

            Student st = new Student(id, fname, cgpa);
            studentList.add(st);
            testCases--;
        }

        Collections.sort(studentList);

        for (Student student : studentList) {
            System.out.println(student.getFname());
        }
    }
}
