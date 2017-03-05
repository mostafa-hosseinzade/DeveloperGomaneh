/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.ContentFacade;
import Entity.Content;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;


@Named(value = "uiController")
@ViewScoped
public class UiController implements Serializable{
    @EJB
    private ContentFacade contentFacade;
    private List<Content> lastIsi;
    
    @PostConstruct
    public void init(){
        System.out.println("---------------------------------------");
        lastIsi= contentFacade.getLastIsi(3);
    }

    public List<Content> getLastIsi() {
        System.out.println("---------------------------------------");
        System.out.println(lastIsi);
        return lastIsi;
    }
    
}
