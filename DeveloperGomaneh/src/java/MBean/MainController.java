/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MBean;

import Bean.PortfolioFacade;
import Entity.Portfolio;
import java.io.File;
import java.util.List;
import java.util.Map;
import javax.annotation.ManagedBean;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;


@Named
@ManagedBean
@RequestScoped
public class MainController {
    @EJB
    private PortfolioFacade ejbPortF;
    private String name;
    private String message;

    public List<Portfolio> getPortFolio(){
        return ejbPortF.findRange(new int[]{0,5});
    }

    public void sendContact(){
        System.out.println("saved");
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
}
