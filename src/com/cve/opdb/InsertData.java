package com.cve.opdb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.TimeZone;

import com.cve.dbc.DatabaseConnection;

public class InsertData {

	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement ps = null;
		
		DatabaseConnection dbc = new DatabaseConnection();
		conn = dbc.getConnection();
		
		conn.setAutoCommit(false);
		//calculate the time
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss:SS");   
		TimeZone t = sdf.getTimeZone();   
		t.setRawOffset(0);   
		sdf.setTimeZone(t);   
		Long startTime = System.currentTimeMillis(); 
		
		String sql = "insert into cve (cve_name, author, published_time, description, type, app_name, " 
				+ "company, platform) values (?, ?, ?, ?, ?, ?, ?, ?)";
		ps = conn.prepareStatement(sql);
		
		String cvename;
		int temp = 20100001;
		String author;
		//Date published_time;
		//String description;
		int type[] = {1, 2, 3, 4};
		//String app_name;
		//String company;
		String platform[] = {"windows", "linux", "mac", "android", "iphone"};
		Random rand = new Random();
		
		System.out.println("Inserting data...handling....");
		for(int i = 0; i < 1000000; i++){
			cvename = "cve-" + Integer.toString(temp);
			ps.setString(1, cvename);
			author = getRandomString() + " " + getRandomString();
			ps.setString(2, author);
			ps.setDate(3, new java.sql.Date(randomDate("2010-01-1", "2017-06-06").getTime()));
			ps.setString(4, getRandomString());
			ps.setInt(5, type[rand.nextInt(4)]);
			ps.setString(6, getRandomString());
			ps.setString(7, getRandomString());
			ps.setString(8, platform[rand.nextInt(5)]);
			temp += 1;
			ps.addBatch();
		}
		ps.executeBatch();
		conn.commit();
		
		Long endTime = System.currentTimeMillis();   
		System.out.println("time：" + sdf.format(new Date(endTime - startTime)));
		
		ps.close();
		conn.close();
	}
	
	public static String getRandomString(){
		String base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 5; i++) {       
	        int number = random.nextInt(base.length());       
	        sb.append(base.charAt(number));       
	       }       
	    return sb.toString(); 
	}
	
	private static Date randomDate(String beginDate, String endDate) {  
        try {  
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
            Date start = format.parse(beginDate);//   
            Date end = format.parse(endDate);//   
            // getTime()表示返回自 1970 年 1 月 1 日 00:00:00 GMT 以来此 Date 对象表示的毫秒数。  
            if (start.getTime() >= end.getTime()) {  
                return null;  
            }  
            long date = random(start.getTime(), end.getTime());  
  
            return new Date(date);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return null;  
    }  
  
    private static long random(long begin, long end) {  
        long rtn = begin + (long) (Math.random() * (end - begin));  
         
        if (rtn == begin || rtn == end) {  
            return random(begin, end);  
        }  
        return rtn;  
    }  

}
