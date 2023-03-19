package com.levan.User;

public class UserDTO {
    private String UserID;
    private String Role;
    private String Password;
    private String FullName;
    private String Phone;
    private String Address;
    private String City;
    private int Point;
    private String RegisterDate;

    public UserDTO(String UserID, String Role, String Password, String FullName, String Phone, 
            String Address, String City, int Point, String RegisterDate) {
        this.UserID = UserID;
        this.Role = Role;
        this.Password = Password;
        this.FullName = FullName;
        this.Phone = Phone;
        this.Address = Address;
        this.City = City;
        this.Point = Point;
        this.RegisterDate = RegisterDate;
    }

    public UserDTO() {
    }
    
    public UserDTO(String UserID) {
        this.UserID = UserID;
    }
    

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getRole() {
        return Role;
    }

    public void setRole(String Role) {
        this.Role = Role;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getCity() {
        return City;
    }

    public void setCity(String City) {
        this.City = City;
    }

    public int getPoint() {
        return Point;
    }

    public void setPoint(int Point) {
        this.Point = Point;
    }

    public String getRegisterDate() {
        return RegisterDate;
    }

    public void setRegisterDate(String RegisterDate) {
        this.RegisterDate = RegisterDate;
    }
    
}
