package MBean;

import Bean.SectionFactorFacade;
import Entity.FactorField;
import Entity.SectionFactor;
import java.io.Serializable;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

@ManagedBean(name = "factor")
@SessionScoped
public class Factor implements Serializable {

    @EJB
    private SectionFactorFacade SFF;

    private SectionFactor SF;
    
    private FactorField TypeSite;

    public FactorField getTypeSite() {
        return TypeSite;
    }
    
    private double price = 0;
    
    private double allPrice = 0;

    public double getAllPrice() {
        return allPrice;
    }

    public void setAllPrice(double allPrice) {
        this.allPrice = allPrice;
    }
    public SectionFactor getSF() {
        SF = null;
        if (this.sectionId == null) {
            SF = this.SFF.find(1);
        } else {
            SF = this.SFF.find(this.sectionId);
        }
        return SF;
    }

    @ManagedProperty(value = "#{param.sectionId}")
    private Integer sectionId;

    public Integer getSectionId() {
        return sectionId;
    }
    
    public void setSectionId(Integer sectionId) {
        this.sectionId = sectionId;
    }
    
    public void setTypeSite(FactorField f){
        this.price = this.price + f.getPrice();
        this.TypeSite = f;
    }
    
    public void addPrice(float price){
        this.price = this.price+price;
    }
    
    public double getPrice(){
        return this.price;
    }
}
