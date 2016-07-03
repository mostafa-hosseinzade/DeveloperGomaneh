/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MBean;

import Bean.FactorFieldFacade;
import Bean.OrderFacade;
import Bean.SectionFactorFacade;
import Entity.FactorField;
import Entity.Order;
import Entity.SectionFactor;
import JsfClass.util.JsfUtil;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
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
    @EJB
    private OrderFacade orderFacade;

    private Integer section;
    private FactorField typeSite;
    private List<FactorField> factorFieldList;
    private List<SectionFactor> sectionList;
    private List<FactorField> SelectedfactorFieldList;
    private double price = 0;
    private Integer personal = 1;
    private Order order;

    public Order getOrder() {

        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Integer getPersonal() {
        return personal;
    }

    public void setPersonal(Integer personal) {
        this.personal = personal;
    }

    public double getPrice() {
        if (SelectedfactorFieldList != null) {
            if (typeSite != null) {
                this.price = typeSite.getPrice();
            } else {
                this.price = 0;
            }

            for (FactorField f : SelectedfactorFieldList) {
                this.price = this.price + f.getPrice();
            }
        }
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
        order = new Order();
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
        if (this.typeSite != null) {
            this.price = typeSite.getPrice();
            this.typeSite = typeSite;
            if (this.SelectedfactorFieldList != null) {
                this.SelectedfactorFieldList = null;
            }
        } else {
            this.price = this.price + typeSite.getPrice();
            this.typeSite = typeSite;
        }
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
        if (this.section == 4) {
            for (FactorField r : typeSite.getChildFeildCollection()) {
                if (this.SelectedfactorFieldList.contains(r)) {
                    this.SelectedfactorFieldList.remove(r);
                }
            }
        } else {
            for (FactorField e : getCurrentSection().getFactorFieldCollection()) {
                if (this.SelectedfactorFieldList.contains(e)) {
                    this.SelectedfactorFieldList.remove(e);
                }
            }
        }

        for (FactorField f : factorFieldList) {
            for (String i : AddSelectedfactorFieldList) {
                if (f.getId() == Integer.valueOf(i)) {
                    if (SelectedfactorFieldList.contains(f) == false) {
                        SelectedfactorFieldList.add(f);
                    }
                }
            }
        }
        this.AddSelectedfactorFieldList = AddSelectedfactorFieldList;
    }

    public void insertInfoUser() {
        if(this.typeSite == null){
            JsfUtil.addErrorMessage("لطفا نوع سایت را انتخاب نمائید");
        }else{
        String field = String.valueOf(this.typeSite.getId());
        try {
            if (this.personal == 0) {
                order.setPersonal(false);
            } else {
                order.setPersonal(true);
            }
            for (FactorField f : SelectedfactorFieldList) {
                field = field + "," + String.valueOf(f.getId());
            }
            order.setArrayField(field);
            order.setCreatedAt(new Date());
            orderFacade.create(order);
        } catch (Exception e) {
            e.printStackTrace();
            JsfUtil.addErrorMessage("مشکل در ثبت اطلاعات لطفا بعدا تلاش کنید");
        }
        JsfUtil.addSuccessMessage("اطلاعات با موفقیت ثبت شد");
        }
    }
}
