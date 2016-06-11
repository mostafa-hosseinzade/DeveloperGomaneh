package MBean;

import Bean.ContentCategoryFacade;
import Bean.ContentFacade;
import Entity.ContentCategory;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

@ManagedBean(name = "content")
@RequestScoped
public class Content {

    @EJB
    private ContentCategoryFacade CCF;

    @EJB
    private ContentFacade CF;

    @ManagedProperty(value = "#{param.ctgId}")
    private Integer contentId;

    @ManagedProperty(value = "#{param.contentShowId}")
    private Integer contentShowId;

    public Integer getContentShowId() {
        return contentShowId;
    }

    public void setContentShowId(Integer contentShowId) {
        this.contentShowId = contentShowId;
    }

    public Integer getContentId() {
        return contentId;
    }

    public void setContentId(Integer contentId) {
        this.contentId = contentId;
    }

    public List<ContentCategory> getMessage() {
        return CCF.findBySubctg(1);
    }

    public String showContent() {
        if (this.contentId == null) {
            return "index";
        }
        return "ShowContents";
    }

    public List<Entity.Content> infoContent() {
        List<Entity.Content> c = null;
        if (this.contentId != null) {
            return CF.getISI(contentId);
        }
        return c;
    }

    public String showInfoContent() {
        if (this.contentShowId == null) {
            return "index";
        }
        return "ShowIsi";
    }
}
