package BatchesGeneration;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Scanner;
import java.util.Date;
import java.sql.*;

public class Cal
{
	String sdate[],edate[];
	public String[] getsdate()
	{
		return sdate;
	}
	public String[] getedate()
	{
		return edate;
	}
	public void generateSchedule(String batchid, Date batchBeginningDate) throws Exception
	{
		Date startDate,endDate,temp=new Date(),batchEndDate;
		int rowCount=0;
		int ndays = 0;
		int countDays=0;
		int finalDays=0;
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
	    Calendar c1 = Calendar.getInstance();
	    c1.setTime(batchBeginningDate);
	    temp = batchBeginningDate;
		Connection con;
		String url = "jdbc:mysql://localhost/ftk?user=root";		
		con = DriverManager.getConnection(url);
		PreparedStatement stat = con.prepareStatement("SELECT COUNT(*) FROM  course");
		ResultSet res = stat.executeQuery();
	    res.next();
	    rowCount = res.getInt(1);
	    sdate = new String[rowCount];
	    edate = new String[rowCount];
	    System.out.println(rowCount);
	    for (int i=0; i<rowCount; i++)
	    {
			countDays = 1;
			if(countDays==1 && ( Calendar.SATURDAY == c1.get(Calendar.DAY_OF_WEEK)  )  )
			{
				c1.add(Calendar.DATE,2);
				startDate =  c1.getTime();
			}
			else if(countDays==1 && ( Calendar.SUNDAY == c1.get(Calendar.DAY_OF_WEEK)  )  )
			{
				c1.add(Calendar.DATE,1);
				startDate =  c1.getTime();				
			}
			else
			{
				startDate = c1.getTime();
			}
			System.out.println("course "+(i+1)+" start date "+startDate);
			sdate[i] = formatter.format(startDate);
			
			stat = con.prepareStatement("SELECT ndays from course where courseid=?" );
			stat.setInt(1,i+1);
			res = stat.executeQuery();
			res.next();
    	ndays = res.getInt(1);
    	res.getString(batchid);

			while(countDays <= ndays)
			{
				boolean chk = checkWeekend(c1);
				if(chk == false)
				{
					countDays++;
				}			
				c1.add(Calendar.DATE,1);

			}
			countDays--;
			c1.add(Calendar.DATE,-1);
			System.out.println("Course end dat "+c1.getTime());
			edate[i] = formatter.format(c1.getTime());
			c1.add(Calendar.DATE,1);
	    	

	    			finalDays = finalDays+countDays;
	    	    	
	    }
	    
		c1.add(Calendar.DATE,-1);
		batchEndDate = c1.getTime();
		System.out.println("batch endate is "+batchEndDate);
		java.sql.Date eDate = new java.sql.Date(batchEndDate.getTime());
		java.sql.Date sDate = new java.sql.Date(batchBeginningDate.getTime()); 
		stat = con.prepareStatement("UPDATE batch set startdate=?,enddate=? where batchid=?");
    	stat.setDate(1,sDate);
    	stat.setDate(2, eDate);
    	stat.setString(3, batchid);
    	stat.executeUpdate();
		System.out.println("Total course Days "+finalDays);
		//System.out.println(c1.getTime());
	}
	static boolean checkWeekend(Calendar temp)
	{
		if( Calendar.SATURDAY != temp.get(Calendar.DAY_OF_WEEK) &&  Calendar.SUNDAY != temp.get(Calendar.DAY_OF_WEEK))
		{
			return false;
		}
		else
		{
			return true;
		}
	}

}