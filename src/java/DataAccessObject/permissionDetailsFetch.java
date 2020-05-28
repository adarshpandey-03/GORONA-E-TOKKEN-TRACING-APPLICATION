package DataAccessObject;

import Entities.permissionForm_entities;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Locale.Category;

public class permissionDetailsFetch {

 private Connection con;

    public permissionDetailsFetch(Connection connect) {
        this.con = connect;
    }
    
    public ArrayList<permissionForm_entities> getAllPermissionList() {        
        ArrayList<permissionForm_entities> list = new ArrayList<>();
        
        try {
            
            String query = "select * from permissiondetails";
            Statement stmt = this.con.createStatement();
            ResultSet set = stmt.executeQuery(query);
            
            while(set.next())
            {
                int permissionID = set.getInt("PermissionID");
                String firstName = set.getString("FirstName");
                String lastName = set.getString("LastName");
                String emailID = set.getString("EmailID");
                String phoneNumber = set.getString("PhoneNumber");
                String adhaar = set.getString("AdhaarNumber");
                String address = set.getString("ResidentialAddress");
                String city = set.getString("City");
                String state = set.getString("State");
                String pincode = set.getString("Pincode");
                String wentLocation = set.getString("wentLocation");
                String reason = set.getString("Reason");
                String status = set.getString("Status");
                String processedBy = set.getString("processedBy");
                Date date = set.getDate("Date:Time_Of_Issue");
                Time time = set.getTime("Date:Time_Of_Issue");

                permissionForm_entities c = new permissionForm_entities(permissionID,firstName,lastName,emailID,phoneNumber,adhaar,address,city,state,pincode,wentLocation,reason,date,time,status,processedBy);
                list.add(c);
            }
            
        } catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        return list;
    }
}
