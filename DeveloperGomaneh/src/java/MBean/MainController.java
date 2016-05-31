/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MBean;

import Bean.ContentCategoryFacade;
import Bean.ContentFacade;
import Bean.PortfolioFacade;
import Entity.Content;
import Entity.Portfolio;
import java.util.List;
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

    @EJB
    private ContentFacade ejbContent;
    @EJB
    private ContentCategoryFacade ejbContentCategory;

    private List<Content> Services;

    public List<Portfolio> getPortFolio() {
        return ejbPortF.getLast();
    }

    public List<Content> getServices() {
        List<Content> l = null;
        if (ejbContent.getServices() != null) {
            l = (List<Content>) ejbContent.getServices().getContentCollection();
        }
        return l;
    }
}
