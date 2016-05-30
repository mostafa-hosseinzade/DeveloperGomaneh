/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import Entity.Portfolio;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author administrator
 */
@Stateless
public class PortfolioFacade extends AbstractFacade<Portfolio> {

    @PersistenceContext(unitName = "DeveloperPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PortfolioFacade() {
        super(Portfolio.class);
    }

    public List<Portfolio> getLast() {
        javax.persistence.Query q = em.createQuery("select u from Portfolio u order by u.id DESC");
        q.setMaxResults(6);
        q.setFirstResult(0);
        return q.getResultList();
    }

}
