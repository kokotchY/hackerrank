package stack.equalstacks;

/**
 * Created by kokotchy on 8/27/16.
 */
public class StackInfo {
    private final int value;
    public int maxSize;
    public int size;

    public StackInfo(int value, int maxSize) {
        this.value = value;
        this.maxSize = maxSize;
    }
}
