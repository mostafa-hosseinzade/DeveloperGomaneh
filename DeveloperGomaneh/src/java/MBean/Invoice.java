/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MBean;

import Bean.SectionFactorFacade;
import Entity.FactorField;
import Entity.SectionFactor;
import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import org.primefaces.event.TabChangeEvent;

/**
 *
 * @author administrator
 */
@ViewScoped
@ManagedBean(name = "invoiceController")
public class Invoice implements Serializable {

    @EJB
    private SectionFactorFacade sectionFactorFacade;

    private Integer section;
    private FactorField typeSite;
    private List<SectionFactor> sectionList;
    private List<FactorField> SelectedfactorFieldList;

    /**
     * Creates a new instance of Invoice
     */
    @PostConstruct
    public void init() {
        section = 1;
        sectionList = sectionFactorFacade.findAll();
    }

    public Invoice() {
    }

    public void onTabChange(TabChangeEvent event) {
        section = Integer.valueOf((String) event.getTab().getAttributes().get("section"));
        System.out.println(section);
    }

    public SectionFactor getCurrentSection() {
        for (SectionFactor sf : sectionList) {
            if (Objects.equals(sf.getId(), section)) {
                return sf;
            }
        }
        return null;
    }

    public FactorField getTypeSite() {
        return typeSite;
    }

    public void setTypeSite(FactorField typeSite) {
        this.typeSite = typeSite;
    }

    public List<FactorField> getSelectedfactorFieldList() {
        return SelectedfactorFieldList;
    }

    public void setSelectedfactorFieldList(List<FactorField> SelectedfactorFieldList) {
        System.out.println(SelectedfactorFieldList);
        this.SelectedfactorFieldList = SelectedfactorFieldList;
    }

}
