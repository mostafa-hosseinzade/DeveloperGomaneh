/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author administrator
 */
@Entity
@Table(name = "PortfolioCategory")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PortfolioCategory.findAll", query = "SELECT p FROM PortfolioCategory p"),
    @NamedQuery(name = "PortfolioCategory.findById", query = "SELECT p FROM PortfolioCategory p WHERE p.id = :id"),
    @NamedQuery(name = "PortfolioCategory.findByCreatedAt", query = "SELECT p FROM PortfolioCategory p WHERE p.createdAt = :createdAt"),
    @NamedQuery(name = "PortfolioCategory.findByDescribtion", query = "SELECT p FROM PortfolioCategory p WHERE p.describtion = :describtion"),
    @NamedQuery(name = "PortfolioCategory.findByMeta", query = "SELECT p FROM PortfolioCategory p WHERE p.meta = :meta"),
    @NamedQuery(name = "PortfolioCategory.findBySlug", query = "SELECT p FROM PortfolioCategory p WHERE p.slug = :slug"),
    @NamedQuery(name = "PortfolioCategory.findByTitle", query = "SELECT p FROM PortfolioCategory p WHERE p.title = :title"),
    @NamedQuery(name = "PortfolioCategory.findByUpdatedAt", query = "SELECT p FROM PortfolioCategory p WHERE p.updatedAt = :updatedAt")})
public class PortfolioCategory implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    @Size(max = 255)
    @Column(name = "`describtion`")
    private String describtion;
    @Size(max = 255)
    @Column(name = "`meta`")
    private String meta;
    @Size(max = 255)
    @Column(name = "`slug`")
    private String slug;
    @Size(max = 255)
    @Column(name = "`title`")
    private String title;
    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;

    public PortfolioCategory() {
    }

    public PortfolioCategory(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getDescribtion() {
        return describtion;
    }

    public void setDescribtion(String describtion) {
        this.describtion = describtion;
    }

    public String getMeta() {
        return meta;
    }

    public void setMeta(String meta) {
        this.meta = meta;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PortfolioCategory)) {
            return false;
        }
        PortfolioCategory other = (PortfolioCategory) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.PortfolioCategory[ id=" + id + " ]";
    }
    
    @PrePersist
    public void SetDateTime(){
        this.createdAt = new Date();
    }
    
    @PreUpdate
    public void setDateTimeUpdate(){
        this.updatedAt = new Date();
    }
}
