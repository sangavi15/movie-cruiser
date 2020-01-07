package com.cognizant.movie.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
public static Date convertToDate(String userDate) {
    try {
        SimpleDateFormat format=new SimpleDateFormat("dd/mm/yyy");
        format.setLenient(false);
       return format.parse(userDate);  //String to Date
    }catch(ParseException e) {
        System.out.println("Date Went Wrong");
        
    }
    return null; //will not be executed/never executed
}

}