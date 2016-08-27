package inheritance;

/**
 * Created by kokotchy on 8/27/16.
 */
public class Student extends Person {
    private int[] testScores;

    public Student(String firstName, String lastName, int idNumber, int[] testScores) {
        super(firstName, lastName, idNumber);
        this.testScores = testScores;
    }

    public char calculate() {
        float average = average(this.testScores);
        if (average >= 90 && average <= 100) {
            return 'O';
        } else if (average >= 80 && average < 90) {
            return 'E';
        } else if (average >= 70 && average < 80) {
            return 'A';
        } else if (average >= 55 && average < 70) {
            return 'P';
        } else if (average >= 40 && average < 55) {
            return 'D';
        } else {
            return 'T';
        }
    }

    private float average(int[] scores) {
        int sum = 0;
        for (int score : scores) {
            sum += score;
        }
        return sum / scores.length;
    }
}
