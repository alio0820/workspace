package com.icss.oa.entity;



/**
 * Book entity. @author MyEclipse Persistence Tools
 */

public class Book  implements java.io.Serializable {


    // Fields    

     private Long bookid;
     private Reader TReader;
     private String bookname;


    // Constructors

    /** default constructor */
    public Book() {
    }

    
    /** full constructor */
    public Book(Reader TReader, String bookname) {
        this.TReader = TReader;
        this.bookname = bookname;
    }

   
    // Property accessors

    public Long getBookid() {
        return this.bookid;
    }
    
    public void setBookid(Long bookid) {
        this.bookid = bookid;
    }

    public Reader getTReader() {
        return this.TReader;
    }
    
    public void setTReader(Reader TReader) {
        this.TReader = TReader;
    }

    public String getBookname() {
        return this.bookname;
    }
    
    public void setBookname(String bookname) {
        this.bookname = bookname;
    }
   








}