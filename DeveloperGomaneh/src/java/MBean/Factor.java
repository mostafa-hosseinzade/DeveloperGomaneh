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

    private static FactorField TypeSite;

    private static List<Integer> arrayidfeild;

    public FactorField getTypeSite() {
        return TypeSite;
    }

    private static double price = 0;

    private static double allPrice = 0;

    private List<String> addId;

    public List<String> getAddId() {
        return addId;
    }

    public void setAddId(List<String> addId) {
        this.addId = addId;
        System.out.println("MBean.Factor.setAddId() is : "+addId);
        for (String f : addId) {
            System.out.println("MBean.Factor.setAddId() is : "+f);
        }
    }

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
//        if (addId != null) {
//            for (Integer i : this.addId) {
//                arrayidfeild.add(i);
//            }
//        }
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

    public void addPrice(float allPrice) {
//        arrayidfeild.add(section);
        this.allPrice = this.allPrice + allPrice;
        this.price = this.price + allPrice;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public double getPrice() {
        return this.price;
    }

    public String filterhtml(String html) {
        return Jsoup.parse(html).text();
    }

}
