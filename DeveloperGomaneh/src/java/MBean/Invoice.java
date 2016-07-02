/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MBean;

import Bean.FactorFieldFacade;
import Bean.SectionFactorFacade;
import Entity.FactorField;
import Entity.SectionFactor;
import java.io.Serializable;
import java.util.ArrayList;
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
    @EJB
    private FactorFieldFacade factorFieldFacad;
    
    private Integer section;
    private FactorField typeSite;
    private List<FactorField> factorFieldList;
    private List<SectionFactor> sectionList;
    private List<FactorField> SelectedfactorFieldList;
    private double price = 0;

    public double getPrice() {
//        if(SelectedfactorFieldList != null){
//            for(FactorField f : SelectedfactorFieldList){
//                this.price = this.price + f.getPrice();
//            }
//        }
        return price;
    }

    /**
     * Creates a new instance of Invoice
     */
    @PostConstruct
    public void init() {
        section = 1;
        sectionList = sectionFactorFacade.findAll();
        factorFieldList = factorFieldFacad.findAll();
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
        if (typeSite != null) {
            for (FactorField t : typeSite.getChildFeildCollection()) {
                System.err.println("Child is : " + t.getId() + " " + t.getTitle());
            }
            System.out.println("MBean.Invoice.getTypeSite() " + this.typeSite.getId() + " " + typeSite.getTitle());
        }
        return typeSite;
    }

    public void setTypeSite(FactorField typeSite) {
        this.price = this.price + typeSite.getPrice();
        this.typeSite = typeSite;
    }

    public List<FactorField> getSelectedfactorFieldList() {
        return SelectedfactorFieldList;
    }

    public void setSelectedfactorFieldList(List<FactorField> SelectedfactorFieldList) {
        System.out.println(SelectedfactorFieldList);
        this.SelectedfactorFieldList = SelectedfactorFieldList;
    }

    private List<String> AddSelectedfactorFieldList;

    public List<String> getAddSelectedfactorFieldList() {
        return AddSelectedfactorFieldList;
    }

    public void setAddSelectedfactorFieldList(List<String> AddSelectedfactorFieldList) {
        if (this.SelectedfactorFieldList == null) {
            this.SelectedfactorFieldList = new ArrayList<>();
        }
        
        List<Integer> selected = new ArrayList<>();
        for(FactorField f : factorFieldList){
           for(String i:AddSelectedfactorFieldList){
               if(f.getId()==Integer.valueOf(i)){
                   if(SelectedfactorFieldList.contains(f) == false){
                       SelectedfactorFieldList.add(f);
                       this.price = price+f.getPrice();
                   }
                   selected.add(f.getId());
               }
           }
        }
//        this.SelectedfactorFieldList.addAll(AddSelectedfactorFieldList);
        this.AddSelectedfactorFieldList = AddSelectedfactorFieldList;
    }

}
