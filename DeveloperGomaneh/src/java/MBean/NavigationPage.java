/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MBean;

import Bean.PortfolioFacade;
import Entity.Portfolio;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

@ManagedBean(name = "NavigationPage", eager = true)
@RequestScoped
public class NavigationPage {

    //this managed property will read value from request parameter pageId
    @ManagedProperty(value = "#{param.pageId}")
    private Integer pageId;
    
    @EJB
    private PortfolioFacade PF;

    
    public Integer getPageId() {
        return pageId;
    }

    public void setPageId(Integer pageId) {
        this.pageId = pageId;
    }

    //condional navigation based on pageId
    //if pageId is 1 show page1.xhtml,
    //if pageId is 2 show page2.xhtml
    //else show home.xhtml
    public String showPage() {
        if (pageId == null) {
            return "index";
        }
        return "Show";
    }
    
    public Portfolio InfoPortfolio(){
        System.out.println("page id is : "+pageId);
        return PF.find(pageId);
    } 
}
