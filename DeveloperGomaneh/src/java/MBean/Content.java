
package MBean;

import Bean.ContentCategoryFacade;
import Entity.ContentCategory;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.bean.ManagedBean;

@ManagedBean(name="content")
@RequestScoped
public class Content {
    
    @EJB
    private ContentCategoryFacade CCF;
    
    public List<ContentCategory> getMessage(){
       return CCF.findBySubctg(1);
    }
    
}
