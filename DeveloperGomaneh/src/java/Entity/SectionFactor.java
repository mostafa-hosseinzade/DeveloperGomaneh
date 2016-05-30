/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author administrator
 */
@Entity
@Table(name = "SectionFactor")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "SectionFactor.findAll", query = "SELECT s FROM SectionFactor s"),
    @NamedQuery(name = "SectionFactor.findById", query = "SELECT s FROM SectionFactor s WHERE s.id = :id"),
    @NamedQuery(name = "SectionFactor.findByCreatedAt", query = "SELECT s FROM SectionFactor s WHERE s.createdAt = :createdAt"),
    @NamedQuery(name = "SectionFactor.findByDescribtion", query = "SELECT s FROM SectionFactor s WHERE s.describtion = :describtion"),
    @NamedQuery(name = "SectionFactor.findByTitle", query = "SELECT s FROM SectionFactor s WHERE s.title = :title"),
    @NamedQuery(name = "SectionFactor.findByUpdatedAt", query = "SELECT s FROM SectionFactor s WHERE s.updatedAt = :updatedAt")})
public class SectionFactor implements Serializable {

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
    @Column(name = "describtion")
    private String describtion;
    @Size(max = 255)
    @Column(name = "title")
    private String title;
    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    @OneToMany(mappedBy = "sectionFactorid")
    private Collection<FactorField> factorFieldCollection;

    public SectionFactor() {
    }

    public SectionFactor(Integer id) {
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

    @XmlTransient
    public Collection<FactorField> getFactorFieldCollection() {
        return factorFieldCollection;
    }

    public void setFactorFieldCollection(Collection<FactorField> factorFieldCollection) {
        this.factorFieldCollection = factorFieldCollection;
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
        if (!(object instanceof SectionFactor)) {
            return false;
        }
        SectionFactor other = (SectionFactor) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.SectionFactor[ id=" + id + " ]";
    }
    
}
