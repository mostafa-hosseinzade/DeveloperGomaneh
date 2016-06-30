/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JsfClass;

import Bean.FactorFieldFacade;
import Entity.FactorField;
import MBean.Factor;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author administrator
 */
@FacesConverter(value = "FactorFieldConverter")
@ManagedBean
public class FactorConvertor implements Converter {

    @EJB
    private FactorFieldFacade FFF;

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        try {
            if (value != null) {
                for(FactorField f:FFF.findAll()){
                    System.out.println("ddddddddddddddddddddddddddddddddddddd"+f);
                    if(f.getId()==Integer.valueOf(value)){
                        System.out.println(f);
                        return f;
                    } 
                }
            } else {
                 System.out.println("ddddddddddddddddddddddddddddddddddddd is null");
                return null;
            }
        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
            return null;
        }
        return null;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        if (value != null) {
            FactorField val = (FactorField) value;
            return String.valueOf(val.getId());
        } else {
            return null;
        }
    }

}
