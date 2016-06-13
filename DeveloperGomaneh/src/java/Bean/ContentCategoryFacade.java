/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import Entity.ContentCategory;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author administrator
 */
@Stateless
public class ContentCategoryFacade extends AbstractFacade<ContentCategory> {

    @PersistenceContext(unitName = "DeveloperPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public void remove(ContentCategory c) {
        if (c.getId() != 1 || c.getId() != 2 || c.getId() != 3 || c.getId() != 4) {
            getEntityManager().remove(c);
        }
    }

    public List<ContentCategory> findBySubctg(Integer subctgid) {
        ContentCategory c = this.find(subctgid);
        Query q = em.createNamedQuery("ContentCategory.findBySubctg");
        q.setParameter("subctg", c);
        return q.getResultList();
    }

    public ContentCategoryFacade() {
        super(ContentCategory.class);
    }

}
