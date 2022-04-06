/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package project_car_rent1;

import java.util.logging.Logger;

/**
 *
 * @author salim
 */
public class Employee extends User{

    public Employee(String email, String password, int number, String firstName, String lastName) {
        super(email, password, number, firstName, lastName);
    }

    public Employee(String email, String password) {
        super(email, password);
    }
}
