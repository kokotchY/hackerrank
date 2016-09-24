package introduction.superkeyword;

/**
 * Created by kokotchy on 9/24/16.
 */
public class Solution {
    public static void main(String[] args) {
        MotorCycle M = new MotorCycle();
    }
}

class BiCycle {
    String define_me() {
        return "a vehicle with pedals.";
    }
}

class MotorCycle extends BiCycle {
    String define_me() {
        return "a cycle with an engine.";
    }

    MotorCycle() {
        System.out.println("Hello I am a motorcycle, I am " + define_me());

        String temp = super.define_me();
        System.out.println("My ancestor is a cycle hwo is " + temp);
    }

}
