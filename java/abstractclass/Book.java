package abstractclass;

/**
 * Created by kokotchy on 8/28/16.
 */
public abstract class Book {
    String title;
    String author;

    Book(String title, String author) {
        this.title = title;
        this.author = author;
    }

    abstract void display();
}
