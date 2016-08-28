package abstractclass;

/**
 * Created by kokotchy on 8/28/16.
 */
class MyBook extends Book {
    private final int price;

    MyBook(String title, String author, int price) {
        super(title, author);
        this.price = price;
    }

    @Override
    void display() {
        System.out.println("Title: "+this.title);
        System.out.println("Author: "+this.author);
        System.out.println("Price: "+this.price);
    }
}
