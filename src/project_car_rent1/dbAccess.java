package project_car_rent1;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

public class dbAccess {
    Connection conn = null;
  

public Connection open(){
    try{
          // db parameters
        String url       = "jdbc:mysql://localhost:3306/cardb";
        String user      = "root";
        String password  = "";

        // create a connection to the database
        conn = DriverManager.getConnection(url, user, password);
        System.out.println("Done Successfully");
   }
    catch( SQLException e ){
      System.out.println("Error Occured " + e.toString());
    }
    return conn;
}
  
public void addCustomer(Customer customer){
    /**
    Use addCustomer to store a new customer in the database
    */
    
    Connection dbConnection = null;
    Statement statement=null;

    String sql = "insert into customer values(,'" 
            +customer.getEmail()+"','"
            +customer.getPassword()+"','" 
            +customer.getFirstName()+"','"
            +customer.getLastName()+"','" 
            +customer.isUserType()+"'," 
            +customer.getBirthday()+"," 
            +customer.getDiscount()
            + ")";

    try{
      //DataSource dataSource = new DataSource();
      //dbConnection = dataSource.open();
      statement = conn.createStatement();
      statement.executeUpdate(sql);
      //System.out.println("Record is inserted into Employee table for  Employee : " + employee.getName());
    }
    catch( SQLException e ){
    }
    finally{
      if( statement != null ){
        try{statement.close();}
        catch( SQLException e ){}
      }

      if( dbConnection != null ){
        try{dbConnection.close();}
        catch( SQLException e ){}
      }
    }
  }

public int findUser(String email,String password){
    /**
    Use findUser when login, return 0:Not existing 1:Employee 2:Customer
    */
    Connection dbConnection = null;
    Statement statementE=null;
    Statement statementC=null;
    ResultSet resEmp;
    ResultSet resCus;
    
    int numRowEmp=0;
    int numRowCus=0;
    
    String sqlEmployee = "select * from employee where email="+email+"and password="+password;
    String sqlCustomer = "select * from customer where email="+email+"and password="+password;


    try{
      //DataSource dataSource = new DataSource();
      //dbConnection = dataSource.open();
      
      //Querry the database
      statementE = conn.createStatement();
      resEmp= statementE.executeQuery(sqlEmployee);
      statementC = conn.createStatement();
      resCus= statementC.executeQuery(sqlCustomer);
      
      //Process
      numRowEmp=resEmp.getRow();
      numRowCus=resCus.getRow();
      
    }
    catch( SQLException e ){
    }
    finally{
        
        if( statementE != null ){
          try{statementE.close();}
          catch( SQLException e ){}
        }
        else if( statementC != null ){
          try{statementC.close();}
          catch( SQLException e ){}
        }

        else if( dbConnection != null ){
          try{dbConnection.close();}
          catch( SQLException e ){}
        }
        
        
    }
    
    if(numRowEmp==0&&numRowCus==0){
        return 0;
    }
    else if(numRowEmp!=0 && numRowCus==0){
        return 1;
    }
    else if(numRowCus!=0 && numRowEmp==0){
        return 2;
    }
    else
    return 0;
}

public Customer loadCustomer(String email,String password){
    /**
    Use loadCustomer to load a customer based on email and password
    */
    //Customer variables
    java.util.Date birthday=null;
    String Sbirthday= "01/01/2000";
    float discount =0;
    int userType = 0;
    int number =0;
    String firstName ="Null";
    String lastName ="Null";
    
    //SQL request
    Connection dbConnection = null;
    Statement statementC=null;
    ResultSet resCus;
    
    
    String sqlCustomer = "select * from customer where email='"+email+"' AND password='"+password+"'";


    try{
                //Querry the database
        statementC = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        resCus= statementC.executeQuery(sqlCustomer);

        //Process
        //Get data from querry
        resCus.first();
        
        //Store data for the customer creation
        number=resCus.getInt(1);
        firstName=resCus.getString(4);
        lastName=resCus.getString(5);
        userType=resCus.getInt(6);
        Sbirthday=resCus.getString(7);
        discount=resCus.getFloat(8);
        
    }
    catch( SQLException e ){
    }
    finally{
        
        if( statementC != null ){
          try{statementC.close();}
          catch( SQLException e ){}
        }

        else if( dbConnection != null ){
          try{dbConnection.close();}
          catch( SQLException e ){}
        } 
    }
    
        try {
            birthday=new SimpleDateFormat("dd-MM-yyyy").parse(Sbirthday);
        } catch (ParseException ex) {
            Logger.getLogger(dbAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

    return new Customer(birthday, discount, userType, email, password, number, firstName, lastName);


}

public Employee loadEmployee(String email,String password){
    /**
    Use loadEmployee to load an employee based on email and password
    */
    //Employee variables
    int number =0;
    String firstName ="Null";
    String lastName ="Null";

    //SQL request
    Connection dbConnection = null;
    Statement statementC=null;
    ResultSet resEmp;

    String sqlEmployee = "select * from employee where email='"+email+"' AND password='"+password+"'";

    try{
        //Querry the database
        statementC = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        resEmp= statementC.executeQuery(sqlEmployee);

        //Process
        //Get data from querry
        resEmp.first();

        //Store data for the employee creation
        number=resEmp.getInt(1);
        firstName=resEmp.getString(4);
        lastName=resEmp.getString(5);

    }
    catch( SQLException e ){
    }
    finally{

        if( statementC != null ){
          try{statementC.close();}
          catch( SQLException e ){}
        }

        else if( dbConnection != null ){
          try{dbConnection.close();}
          catch( SQLException e ){}
        } 
    }

    return new Employee(email, password, number, firstName, lastName);

    }
}