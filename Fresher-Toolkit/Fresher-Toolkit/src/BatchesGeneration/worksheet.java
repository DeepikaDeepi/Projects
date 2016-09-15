package BatchesGeneration;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.sql.*;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
//import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

public class worksheet 
{
	Batch b;
	public worksheet(int not)
	{
		b = new Batch(not);
	}
	public int batch()
	{

		b.nob = b.calcBatches();
		return b.nob;
	}
	public String[] getBatchId()
	{
		String batchID[] = new String[b.nob];
		batchID = b.generateBatchID();
		return batchID;
	}
	public String[] getFresherId()
	{
		String fresherID[] = new String[b.noOfTrainee];
		fresherID = b.generateFresherID();
		return fresherID;
	}	
    public void get() {
        try{
        	try
        	{
        		Class.forName("com.mysql.jdbc.Driver").newInstance();
        	}
        	catch(Exception e)
        	{
        		System.out.println("Failed to load mySQL driver...");
        		return;
        	}
        	String url = "jdbc:mysql://localhost/ftk?user=root";
            Connection con = (Connection)DriverManager.getConnection(url);
            con.setAutoCommit(false);
            PreparedStatement stm = null;            
            FileInputStream input = new FileInputStream("D:\\Summer intern\\Proj\\FresherData.xls");
            POIFSFileSystem fs = new POIFSFileSystem( input );
            HSSFWorkbook wb = new HSSFWorkbook(fs);
            HSSFSheet sheet = wb.getSheetAt(0);
            Row row;
            //String batchID[]=b.generateBatchID();
            String batchID[]= this.getBatchId();
            //String fresherID[]=b.generateFresherID();
            String fresherID[] = this.getFresherId();
            int h=0,k=0;
            for(int i:b.batchsize)
            {
            	for(int j=0;j<i;j++)
            	{     	
            		row = sheet.getRow(h);
            		String id = fresherID[h];
            		String name =  row.getCell(0).getStringCellValue();
            		Date dob =  row.getCell(1).getDateCellValue();
            		Calendar db = Calendar.getInstance();
            		int d = db.get(Calendar.DAY_OF_MONTH);
            		int m = db.get(Calendar.MONTH);
            		int y = db.get(Calendar.YEAR);
            		Calendar c = Calendar.getInstance();
            		c.set(y, m, d);
            		db.setTime(dob);            		            	
            		double num = row.getCell(2).getNumericCellValue();	
            		DecimalFormat pattern = new DecimalFormat("#,#,#,#,#,#,#,#,#,#");	
            		NumberFormat testNumberFormat = NumberFormat.getNumberInstance(); 
            		String mob = testNumberFormat.format(num);	
            		Number n = null; 
            		try{n = pattern.parse(mob);} 
            		catch ( ParseException e ){e.printStackTrace();}
            		String numberr = n.toString();            		
            		String mail =  row.getCell(3).getStringCellValue();
            		String address =  row.getCell(4).getStringCellValue();
            		String qualification =  row.getCell(5).getStringCellValue();                
            		String institution =  row.getCell(6).getStringCellValue();
            		Date doj =  row.getCell(7).getDateCellValue();            		
            		String batchid = batchID[k];            		
            		String password = "a";
            		java.sql.Date sqlDob = new java.sql.Date(dob.getTime());            		
            		java.sql.Date sqlDoj = new java.sql.Date(doj.getTime());                   		
            		stm=(PreparedStatement) con.prepareStatement("insert into fresher values(?,?,?,?,?,?,?,?,?,?,?)");   
            		stm.setString(1, id);
            		stm.setString(2, name);
            		stm.setDate(3, sqlDob);
            		stm.setLong(4,(Long) n);
            		stm.setString(5, address);
            		stm.setString(6, batchid);
            		stm.setString(7, qualification);
            		stm.setString(8, password);            		
            		stm.setString(9,mail);
            		stm.setDate(10, sqlDoj);
            		stm.setString(11, institution);
            		stm.execute();
            		System.out.println("Import rows "+ h++);
            	}          
            	k++;
            }
            con.commit();
            stm.close();
            con.close();
            input.close();
            System.out.println("Success import excel to mysql table");
        }catch(SQLException ex){
            System.out.println(ex);
        }catch(IOException ioe){
            System.out.println(ioe);
        }
    }   
}


