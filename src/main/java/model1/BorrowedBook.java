package model1;

import java.sql.Timestamp;

public class BorrowedBook {
    private int id;
    private int userId;
    private int bookId;
    private String bookTitle;
    private Timestamp borrowDate;

    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBookId() {
        return bookId;
    }
    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBookTitle() {
        return bookTitle;
    }
    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public Timestamp getBorrowDate() {
        return borrowDate;
    }
    public void setBorrowDate(Timestamp borrowDate) {
        this.borrowDate = borrowDate;
    }
}

