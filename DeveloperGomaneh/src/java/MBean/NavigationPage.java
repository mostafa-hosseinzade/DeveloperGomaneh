/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MBean;

import Bean.ContentFacade;
import Bean.PortfolioFacade;
import Entity.Content;
import Entity.Portfolio;
import java.util.List;
import javax.annotation.PostConstruct;
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

    @ManagedProperty(value = "#{param.serviceId}")
    private Integer serviceId;

    public Integer getServiceId() {
        return serviceId;
    }

    public void setServiceId(Integer serviceId) {
        this.serviceId = serviceId;
    }

    private Portfolio portfolio;

    public Portfolio getportfolio() {
        return portfolio;
    }

    @EJB
    private PortfolioFacade PF;

    @EJB
    private ContentFacade CF;

    private Content content;

    public Content getContent() {
        return content;
    }

    public void setContent(Content content) {
        this.content = content;
    }

    public Integer getPageId() {
        return pageId;
    }

    public void setPageId(Integer pageId) {
        this.pageId = pageId;
    }

    public String showPage() {
        if (pageId == null) {
            return "index";
        }
        return "Show";
    }

    public String showServices() {
        if (serviceId == null) {
            return "index";
        }
        return "Services";
    }

    @PostConstruct
    public void getAction() {
        if (pageId != null) {
            this.InfoPortfolio();
        }
        if (serviceId != null) {
            this.InfoServices();
        }
    }

    public void InfoPortfolio() {
        if (pageId != null) {
            Portfolio p = PF.find(pageId);
            this.portfolio = p;
            Integer v = p.getVisit();
            System.out.println(v);
            p.setVisit(v + 1);
            PF.edit(p);
        }
    }

    public void InfoServices() {
        if (serviceId != null) {
            content = CF.find(serviceId);
        }
    }


}
