package DataAccessObject;

import Entities.adminLogin_entities;
import Entities.emergencyForm_entities;
import Entities.permissionForm_entities;
import Entities.suggestionForm_entities;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User_Dao {

    private Connection con;

    public User_Dao(Connection connect) {
        this.con = connect;
    }

    //method to insert user registration to database:
    public boolean saveUser(permissionForm_entities user) {
        boolean f = false;
        try {
            //user--> database (inserting user data into database)
            String query = "insert into permissiondetails(FirstName,LastName,EmailID,PhoneNumber,AdhaarNumber,ResidentialAddress,City,State,Pincode,wentLocation,Reason,Date:Time_Of_Issue) values(?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getFirstName());
            pstmt.setString(2, user.getLastName());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getPhoneNumber());
            pstmt.setString(5, user.getAdhaar());
            pstmt.setString(6, user.getAddress());
            pstmt.setString(7, user.getCity());
            pstmt.setString(8, user.getState());
            pstmt.setString(9, user.getPincode());
            pstmt.setString(10, user.getWentLocation());
            pstmt.setString(11, user.getReason());
            pstmt.executeUpdate();
            f = true;
            System.out.print(f);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean saveSuggestion(suggestionForm_entities suggestion) {
        boolean f = false;
        try {
            //Inserting Suggestion into Database
            String query = "insert into suggestiondetails(Salutation,FirstName,LastName,EmailID,PhoneNumber,Qualification,ResidentialAddress,City,State,SuggestionDescription,Doc,Image,Video) values(?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, suggestion.getSalutation());
            pstmt.setString(2, suggestion.getFirstName());
            pstmt.setString(3, suggestion.getLastName());
            pstmt.setString(4, suggestion.getEmailID());
            pstmt.setString(5, suggestion.getPhoneNumber());
            pstmt.setString(6, suggestion.getQualification());
            pstmt.setString(7, suggestion.getResidentialAddress());
            pstmt.setString(8, suggestion.getCity());
            pstmt.setString(9, suggestion.getState());
            pstmt.setString(10, suggestion.getSuggestion());
            pstmt.setString(11, suggestion.getDocName());
            pstmt.setString(12, suggestion.getImgName());
            pstmt.setString(13, suggestion.getVideoName());
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    //get Admin Login Username and Password
    public adminLogin_entities getUserByUsernameAndPassword(String username, String password) {
        adminLogin_entities admin = null;

        try {
            String query = "select * from admin_Credentials where UserName=? and Password=? ";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            ResultSet rst = pstmt.executeQuery();

            if (rst.next()) {
                admin = new adminLogin_entities();

                //data from database
                String name = rst.getString("Name");
                admin.setName(name); //set to admin object

                admin.setAge(rst.getString("Age"));
                admin.setUsername(rst.getString("UserName"));
                admin.setPassword(rst.getString("Password"));
                admin.setAdhaarNumber(rst.getString("AdhaarNumber"));
                admin.setPhoneNumber(rst.getString("PhoneNumber"));
                admin.setCity(rst.getString("City"));
                admin.setState(rst.getString("State"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }
 
//reteriving data according to city
    
   public permissionForm_entities getPermissionData()
    {
        permissionForm_entities pfe = null;
        try {
            
            String query = "select * from permissiondetails";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            
            ResultSet rst = pstmt.executeQuery();

            if (rst.next()) {
                pfe = new permissionForm_entities();

                //data from database
                pfe.setPermissionID(rst.getInt("PermissionID"));
                String firstName = rst.getString("firstName");
                pfe.setFirstName(firstName); //set to admin object
                pfe.setLastName(rst.getString("lastName"));
                pfe.setEmail(rst.getString("emailID"));
                pfe.setPhoneNumber(rst.getString("PhoneNumber"));
                pfe.setAdhaar(rst.getString("AdhaarNumber"));
                pfe.setAddress(rst.getString("ResidentialAddress"));
                pfe.setCity(rst.getString("city"));
                pfe.setState(rst.getString("state"));
                pfe.setPincode(rst.getString("pincode"));
                pfe.setWentLocation(rst.getString("wentLocation"));
                pfe.setReason(rst.getString("reason"));
                
            }
        } catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        return pfe;
    }
    
    public boolean insertStatus(int PermissionID) {
        boolean f = false;
        
        String query = "Update permissiondetails set Status = 'Allowed' where PermissionID=?";
        PreparedStatement pstmt;
        try {
            pstmt = this.con.prepareStatement(query);
            pstmt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
   
        return f;
    }


public boolean emergencyUser(emergencyForm_entities emergency) {
        boolean f = false;
        try {
            //user--> database (inserting user data into database)
            String query = "insert into emergencypermission(PhoneNumber,AdhaarNumber,EmergencyType) values(?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, emergency.getPhoneNumber());
            pstmt.setString(2, emergency.getAdhaarNumber());
            pstmt.setString(3, emergency.getEmergencyType());
            f = true;
            System.out.print(f);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
