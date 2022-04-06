/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package project_car_rent1;
import java.util.Date;
/**
 *
 * @author salim
 */
public class Customer extends User {
    private Date birthday;
    private float discount;
    private int userType; //true individual false business 

    public Customer(Date birthday, float discount, int userType, String email, String password, int number, String firstName, String lastName) {
        super(email, password, number, firstName, lastName);
        this.birthday = birthday;
        this.discount = discount;
        this.userType = userType;
    }

    public Customer(Date birthday, float discount, int userType, String email, String password) {
        super(email, password);
        this.birthday = birthday;
        this.discount = discount;
        this.userType = userType;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public int isUserType() {
        return userType;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }
    
    
}

