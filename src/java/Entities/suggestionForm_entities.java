package Entities;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import javax.servlet.http.Part;

public class suggestionForm_entities {

   private String salutation; 
   private String firstName;
   private String lastName;
   private String emailID;
   private String phoneNumber;
   private String qualification;
   private String residentialAddress;
   private String city;
   private String state;
   private String suggestion;
   private String docName;
   private String imgName;
   private String videoName;

    public String getSalutation() {
        return salutation;
    }

    public void setSalutation(String salutation) {
        this.salutation = salutation;
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

    public String getEmailID() {
        return emailID;
    }

    public void setEmailID(String emailID) {
        this.emailID = emailID;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getResidentialAddress() {
        return residentialAddress;
    }

    public void setResidentialAddress(String residentialAddress) {
        this.residentialAddress = residentialAddress;
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

    public String getSuggestion() {
        return suggestion;
    }

    public void setSuggestion(String suggestion) {
        this.suggestion = suggestion;
    }

    public String getDocName() {
        return docName;
    }

    public void setDocName(String docName) {
        this.docName = docName;
    }

    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }

    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    public suggestionForm_entities(String salutation, String firstName, String lastName, String emailID, String phoneNumber, String qualification, String residentialAddress, String city, String state, String suggestion, String docName, String imgName, String videoName) {
        this.salutation = salutation;
        this.firstName = firstName;
        this.lastName = lastName;
        this.emailID = emailID;
        this.phoneNumber = phoneNumber;
        this.qualification = qualification;
        this.residentialAddress = residentialAddress;
        this.city = city;
        this.state = state;
        this.suggestion = suggestion;
        this.docName = docName;
        this.imgName = imgName;
        this.videoName = videoName;
    }
   
   
           
    
}
