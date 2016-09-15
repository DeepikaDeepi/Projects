package BatchesGeneration;
import java.sql.DriverManager;
import java.util.Calendar;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
public class Batch 
{
	int noOfTrainee;
	int batchsize[];
	int nob;
	public Batch(int noOfTrainee)
	{
		this.noOfTrainee = noOfTrainee;
	}
	int[] getBatchSize()
	{
		return batchsize;
	}
	public int getnot()
	{
		return noOfTrainee;
	}
	public int getnob()
	{
		return nob;
	}
	public int calcBatches()
	{		
		int count,i,temp,temp1;
		i=0;
		temp = noOfTrainee;
		temp1 = noOfTrainee;
		while(temp1>=25)
		{
			nob = nob + 1; 
			temp1 = temp1 - 25;
		}
		if (temp1 != 0 )
		{
			nob = nob +1;
			count = temp1;
			System.out.println(count);
		}
		batchsize = new int[nob];
		while(temp>=25)
		{
				batchsize[i++] = 25;
				temp = temp - 25; 
		}
		if(temp!=0)
		{
			batchsize[i] = temp;
		}

		return nob;
	}	
	public String[] generateBatchID()
	{
		String batchID[] = new String[this.nob];
		Date dt = new Date();
		String dat = dt.toLocaleString();		
		String month = dat.substring(0, 3);
		String year = dat.substring(10,12);
		String mon = month(month);
		System.out.println("The number of batches are"+nob);
		for(int i=0;i<this.nob;i++)
		{
			batchID[i] = year +mon + "B" + Integer.toString(i+1);
			try
        	{
        		Class.forName("com.mysql.jdbc.Driver").newInstance();
        	}
        	catch(Exception e)
        	{
        		System.out.println("Failed to load mySQL driver...");        		
        	}
        	String url = "jdbc:mysql://localhost/ftk?user=root";
        	Date ddt=new Date();
        	java.sql.Date stdt = new java.sql.Date(ddt.getTime());
        	java.sql.Date enddt = new java.sql.Date(ddt.getTime());
        	try
        	{
        		Connection con = (Connection)DriverManager.getConnection(url);
        		PreparedStatement stm=(PreparedStatement) con.prepareStatement("insert into batch values(?,?,?,?,?)");
        		stm.setString(1, batchID[i]);
        		stm.setInt(2, batchsize[i]);
        		stm.setDate(3,null);
        		stm.setDate(4,null);
        		stm.setBoolean(5, false);
        		stm.execute();
        	}
        	catch(Exception e)
        	{
        		System.out.println("exception is " + e);
        	}
			System.out.println("......" +batchID[i]);
		}
		System.out.println("The date is : " + dat + "The month is " + month + month(month)+"    " + year);
		System.out.println("The batchid is :");
		for(int i=0;i<nob;i++)
		{
			System.out.println(batchID[i]);
		}
		return batchID;
	}
	public String month(String month)
	{
		String m=null;		
		switch(month)
		{
			case "Jan":
				m="01";
				break;
						
			case "Feb":
				m="02";
				break;
				
			case "Mar":
				m="03";
				break;
				
			case "Apr":
				m="04";
				break;
				
			case "May":
				m="05";
				break;
				
			case "Jun":
				m="06";
				break;
				
			case "Jul":
				m="07";
				break;
				
			case "Aug":
				m="08";				
				break;
				
			case "Sep":
				m="09";				
				break;
				
			case "Oct":
				m="10";
				break;
				
			case "Nov":
				m="11";
				break;
				
			case "Dec":
				m="12";
				break;							
		}		
		return m;
	}
	public String[] generateFresherID()
	{
		String fresherID[] = new String[noOfTrainee];
		System.out.println("Number of trainees are : " + noOfTrainee);
		Date date = new Date();
		String dt = date.toLocaleString();
		String month = dt.substring(0, 3);
		String year = dt.substring(10,12);
		String mon = month(month);
		int j=0,h=0;
		for(int n:batchsize)
		{
			h++;
			for(int i=0;i<n;i++)
			{
				fresherID[j] = year + "B" + h + mon + "F" + (j+1); 
				j++;
			}
		}
		System.out.println("FresherID are : ");
		for(int i=0;i<noOfTrainee;i++)
		{
			System.out.println(fresherID[i]);
		}
		return fresherID;
	}
	public String generateTrainerID()
	{
		String trainerID=null;
		Date dat = new Date();
		String dt = dat.toLocaleString();
		String year = dt.substring(10,12);
		return trainerID;
	}
}