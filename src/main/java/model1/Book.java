package model1;

public class Book {
    private int id;
    private String title;
    private String author;
    private int available;  // number of available copies

    // Getters and Setters
    public int getId() {
    	return id; 
    	}
    
    public void setId(int id) { 
    	this.id = id; 
    	}
    

    public String getTitle() { 
    	return title; 
    	}
    
    public void setTitle(String title) { 
    	this.title = title; 
    	}

    public String getAuthor() {
    	return author;
    	}
    
    public void setAuthor(String author) {
    	this.author = author;
    	}

    public int getAvailable() {
    	return available; 
    	}
    
    public void setAvailable(int available) {
    	this.available = available;
    	}
}
