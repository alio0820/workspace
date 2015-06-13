package com.etc.OurProgram.service;

import java.sql.SQLException;

public interface financeInsertService {
       boolean insert(String Date,String Own_project,String Money,String Borrow_object,String Pay_way,String Government_buystyle,String Government_buysite,String ProofID,String Contract_special,String Summary,String Haber_subject,String Project_manage,String Government_buyway,String Government_buyclassify,String IsSubmit) throws ClassNotFoundException, SQLException;
}
