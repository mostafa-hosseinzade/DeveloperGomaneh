package MBean;

import Bean.ContentCategoryFacade;
import Bean.ContentFacade;
import Entity.ContentCategory;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import Entity.Content;
import javax.faces.context.FacesContext;
import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;

@ManagedBean(name = "content")
@RequestScoped
public class Contents {

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
        try {
            return CCF.findBySubctg(1);
        } catch (Exception e) {
            return null;
        }
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
            FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("ctgid", contentId);
            return CF.getISI(contentId);
        }
        int sessionId = 0;
        sessionId = (int) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("ctgid");
        if (sessionId != 0) {
            return CF.getISI(sessionId);
        }
        return c;
    }

    public String showInfoContent() {
        return "ShowIsi";
    }

    public Content InfoContentSelect() {
        Content c = CF.find(this.contentShowId);
        return c;
    }

    public String ShowNoneHtml(String input) {
        String i = Jsoup.clean(input, Whitelist.simpleText());
        return i;
    }
}
