package prac;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

 class difference {

 
  public static int countDiffDay(Calendar c1, Calendar c2) {
    int returnInt = 0;
    while (!c1.after(c2)) {
    	System.out.println(returnInt);
      c1.add(Calendar.DAY_OF_MONTH, 1);
      //System.out.println(c1);
      returnInt++;
    }

    if (returnInt > 0) {
      returnInt = returnInt - 1;
    }
    System.out.println(returnInt);
    return (returnInt);
  }

  public static Date makeDate(String dateString) throws Exception {
    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
    Date a=formatter.parse(dateString);
    //System.out.println("date is:"+a);
    return a;
  }

  public static void main(String argv[]) throws Exception {
    Scanner sc = new Scanner(System.in);  
    System.out.print("Enter Date1: ");  
    String da1 = sc.nextLine();  
    System.out.print("Enter Date2: ");  
    String da2 = sc.nextLine();  

    java.util.Date d1 = makeDate(da1);
    java.util.Date d2 = makeDate(da2);
    Calendar c1 = Calendar.getInstance();
    Calendar c2 = Calendar.getInstance();    

    c1.setTime(d1);
    System.out.println("Day is "+c1.get(c1.DAY_OF_WEEK));  
    c2.setTime(d2);
    int diffDay = 0;

    if (c1.before(c2)) {
      diffDay = countDiffDay(c1, c2);
    } else {
      diffDay = countDiffDay(c2, c1);
    }
    System.out.println("Difference is:"+diffDay);

  
  }

  
}