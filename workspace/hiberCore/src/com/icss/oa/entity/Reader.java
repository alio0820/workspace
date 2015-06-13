package com.icss.oa.entity;

import java.util.HashSet;
import java.util.Set;


/**
 * Reader entity. @author MyEclipse Persistence Tools
 */

public class Reader  implements java.io.Serializable {


    // Fields    

     private Long readerid;
     private String readername;
     private Set TBooks = new HashSet(0);


    // Constructors

    /** default constructor */
    public Reader() {
    }

    
    /** full constructor */
    public Reader(String readername, Set TBooks) {
        this.readername = readername;
        this.TBooks = TBooks;
    }

   
    // Property accessors

    public Long getReaderid() {
        return this.readerid;
    }
    
    public void setReaderid(Long readerid) {
        this.readerid = readerid;
    }

    public String getReadername() {
        return this.readername;
    }
    
    public void setReadername(String readername) {
        this.readername = readername;
    }

    public Set getTBooks() {
        return this.TBooks;
    }
    
    public void setTBooks(Set TBooks) {
        this.TBooks = TBooks;
    }
   








}