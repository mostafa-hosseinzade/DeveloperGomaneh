package MBean;

import Bean.FactorFieldFacade;
import Bean.SectionFactorFacade;
import Entity.FactorField;
import Entity.SectionFactor;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.enterprise.context.SessionScoped;
import org.jsoup.Jsoup;

@ManagedBean(name = "factor")
@SessionScoped
public class Factor implements Serializable {

    @EJB
    private SectionFactorFacade SFF;

    @EJB
    private FactorFieldFacade FFF;

    private SectionFactor SF;
    private Integer temp;
    private List<FactorField> factorFieldId;


    public Integer getTemp() {
        return temp;
    }

    public void setTemp(Integer temp) {
        this.temp = temp;
    }

    public List<Integer> getFactorFieldList() {
        List<Integer> fl = new ArrayList<>();
        for (FactorField f : getSF().getFactorFieldCollection()) {
            fl.add(f.getId());
        }
        return fl;
    }

    public SectionFactor getSF() {
        SF = this.SFF.find(this.sectionId);
        System.out.println(SF);
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

    private Integer sectionId=1;

    public Integer getSectionId() {
        return sectionId;
    }

    public String filterhtml(String html) {
        return Jsoup.parse(html).text();
    }

    public List<FactorField> getFactorFieldId() {
        return factorFieldId;
    }

    public void setFactorFieldId(List<FactorField> factorFieldId) {
        this.factorFieldId = factorFieldId;
    }

}
