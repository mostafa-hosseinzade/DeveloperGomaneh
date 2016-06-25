package MBean;

import Bean.FactorFieldFacade;
import Bean.SectionFactorFacade;
import Entity.FactorField;
import Entity.SectionFactor;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import org.jsoup.Jsoup;

@ManagedBean(name = "factor")
@SessionScoped
public class Factor implements Serializable {

    @EJB
    private SectionFactorFacade SFF;

    @EJB
    private FactorFieldFacade FFF;

    private SectionFactor SF;

    public SectionFactor getSF() {
        SF = null;
        if (this.sectionId == null) {
            SF = this.SFF.find(1);
        } else {
            SF = this.SFF.find(this.sectionId);
        }
        return SF;
    }

    private static FactorField TypeSite;

    public FactorField getTypeSite() {
        return TypeSite;
    }

    public void setTypeSite(FactorField f) {
        this.price = f.getPrice();
        this.allPrice = f.getPrice();
        this.TypeSite = f;
        if (arrayidfeild == null) {
            arrayidfeild = new ArrayList<>();
        }
        arrayidfeild.add(f.getId());
    }

    public void setSectionId(Integer sectionId) {
        this.sectionId = sectionId;
    }

    private static List<Integer> arrayidfeild;

    private static double price = 0;

    public void addPrice(float allPrice) {
        this.allPrice = this.allPrice + allPrice;
        this.price = this.price + allPrice;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    private static double allPrice = 0;

    public double getAllPrice() {
        return allPrice;
    }

    public void setAllPrice(double allPrice) {
        this.allPrice = allPrice;
    }

    public double getPrice() {
        return this.price;
    }

    @ManagedProperty(value = "#{param.sectionId}")
    private Integer sectionId;

    public Integer getSectionId() {
        return sectionId;
    }

    public String filterhtml(String html) {
        return Jsoup.parse(html).text();
    }
    
    private List<Integer> addId;

    public List<Integer> getAddId() {
        return addId;
    }

    public void setAddId(List<Integer> addId) {
        this.addId = addId;
        System.out.println("MBean.Factor.setAddId() is : " + addId);
    }
}
