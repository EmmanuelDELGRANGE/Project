/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package project_car_rent1;

import java.sql.SQLException;
import javax.swing.JFrame;

/**
 *
 * @author salim
 */
public class Project_car_rent1 extends javax.swing.JFrame{

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {   
        Customer c;
        //new LoginPopUp().setVisible(true);
        //JFrame win = new LoginPopUp() ;
        //win.setVisible(true);
        //new MainMenu().setVisible(true);
        dbAccess d =new dbAccess();
        d.open();
        c=d.loadCustomer("JOJO@rock.com", "AllumezLeFeu69");
        
    }
    
}
