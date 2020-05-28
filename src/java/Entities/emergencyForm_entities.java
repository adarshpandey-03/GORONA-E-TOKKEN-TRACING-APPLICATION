package Entities;

public class emergencyForm_entities {

private String emergencyID;
private String phoneNumber;
private String adhaarNumber;
private String emergencyType;

    public String getEmergencyID() {
        return emergencyID;
    }

    public void setEmergencyID(String emergencyID) {
        this.emergencyID = emergencyID;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAdhaarNumber() {
        return adhaarNumber;
    }

    public void setAdhaarNumber(String adhaarNumber) {
        this.adhaarNumber = adhaarNumber;
    }

    public String getEmergencyType() {
        return emergencyType;
    }

    public void setEmergencyType(String emergencyType) {
        this.emergencyType = emergencyType;
    }

    public emergencyForm_entities(String phoneNumber, String adhaarNumber, String emergencyType) {
        this.phoneNumber = phoneNumber;
        this.adhaarNumber = adhaarNumber;
        this.emergencyType = emergencyType;
    }



    
}
