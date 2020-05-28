package Entities;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class permissionForm_entities {
    private int PermissionID;
private String adhaar;
private String firstName;
private String lastName;
private String email;
private String phoneNumber;
private String address;
private String city;
private String state;
private String pincode;
private String wentLocation;
private String reason;
private Date date;
private Time time;
private String status;
private String processedBy;

    public permissionForm_entities() {
    
    }

    public permissionForm_entities(String firstName, String lastName, String email, String phoneNumber, String adhaar, String address, String city, String state, String pincode, String wentLocation, String reason, String currenttime) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getAdhaar() {
        return adhaar;
    }

    public void setAdhaar(String adhaar) {
        this.adhaar = adhaar;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public String getWentLocation() {
        return wentLocation;
    }

    public void setWentLocation(String wentLocation) {
        this.wentLocation = wentLocation;
    }

    public permissionForm_entities(String firstName, String lastName, String email, String phoneNumber, String adhaar, String address, String city, String state, String pincode, String wentLocation, String reason) {
        this.adhaar = adhaar;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.city = city;
        this.state = state;
        this.pincode = pincode;
        this.wentLocation = wentLocation;
        this.reason = reason;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public int getPermissionID() {
        return PermissionID;
    }

    public void setPermissionID(int PermissionID) {
        this.PermissionID = PermissionID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getProcessedBy() {
        return processedBy;
    }

    public void setProcessedBy(String processedBy) {
        this.processedBy = processedBy;
    }

    
    public permissionForm_entities(int PermissionID, String firstName, String lastName, String email, String phoneNumber, String adhaar, String address, String city, String state, String pincode, String wentLocation, String reason, Date date, Time time, String status, String processedBy) {
        this.PermissionID = PermissionID;
        this.adhaar = adhaar;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.city = city;
        this.state = state;
        this.pincode = pincode;
        this.wentLocation = wentLocation;
        this.reason = reason;
        this.date = date;
        this.time = time;
        this.status = status;
        this.processedBy = processedBy;
    }

    public permissionForm_entities(int PermissionID) {
        this.PermissionID = PermissionID;
    }



}
