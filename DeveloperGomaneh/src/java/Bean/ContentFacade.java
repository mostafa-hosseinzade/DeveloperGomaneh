/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import Entity.Content;
import Entity.ContentCategory;
import java.util.LinkedList;
import java.util.List;
import javax.ejb.EJB;
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
    
    @EJB
    ContentCategoryFacade CCF;
    
    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ContentFacade() {
        super(Content.class);
    }

    public ContentCategory getServices() {
        try{
            return CCF.find(2);
        }catch(Exception e){
            return null;
        }
    }
    
    public List<Content> getISI(Integer id){
        ContentCategory CC = CCF.find(id);
        return em.createNamedQuery("Content.findBycontentCategoryid").setParameter("contentCategoryid", CC).getResultList();
    }
    
    public List<Content> getLastIsi(Integer count){
        return em.createQuery("select c from Content c order by c.createdAt desc").setMaxResults(count).getResultList();
    }
}
