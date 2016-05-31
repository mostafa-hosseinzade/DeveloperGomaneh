/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import Entity.Content;
import Entity.ContentCategory;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author administrator
 */
@Stateless
public class ContentFacade extends AbstractFacade<Content> {

    @PersistenceContext(unitName = "DeveloperPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ContentFacade() {
        super(Content.class);
    }

    public ContentCategory getServices() {
        ContentCategory CC = null;
        javax.persistence.Query q = em.createQuery("select u from ContentCategory u where u.title = :title");
        q.setParameter("title", "Service");
        if (q.getResultList().isEmpty()) {
            return CC;
        }
        CC = (ContentCategory) q.getSingleResult();
        return CC;
    }

}
