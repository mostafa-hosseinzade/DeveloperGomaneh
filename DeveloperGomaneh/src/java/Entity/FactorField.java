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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author administrator
 */
@Entity
@Table(name = "FactorField")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "FactorField.findAll", query = "SELECT f FROM FactorField f"),
    @NamedQuery(name = "FactorField.findById", query = "SELECT f FROM FactorField f WHERE f.id = :id"),
    @NamedQuery(name = "FactorField.findByTitle", query = "SELECT f FROM FactorField f WHERE f.title = :title"),
    @NamedQuery(name = "FactorField.findByPrice", query = "SELECT f FROM FactorField f WHERE f.price = :price"),
    @NamedQuery(name = "FactorField.findByDescribtion", query = "SELECT f FROM FactorField f WHERE f.describtion = :describtion"),
    @NamedQuery(name = "FactorField.findByCreatedAt", query = "SELECT f FROM FactorField f WHERE f.createdAt = :createdAt"),
    @NamedQuery(name = "FactorField.findByUpdatedAt", query = "SELECT f FROM FactorField f WHERE f.updatedAt = :updatedAt")})
public class FactorField implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "title")
    private String title;
    @Basic(optional = false)
    @NotNull
    @Column(name = "price")
    private long price;
    @Size(max = 3000)
    @Column(name = "describtion")
    private String describtion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    @JoinColumn(name = "User_id", referencedColumnName = "id")
    @ManyToOne
    private User userid;
    @JoinColumn(name = "SectionFactor_id", referencedColumnName = "id")
    @ManyToOne
    private SectionFactor sectionFactorid;

    public FactorField() {
    }

    public FactorField(Integer id) {
        this.id = id;
    }

    public FactorField(Integer id, String title, long price, Date createdAt) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.createdAt = createdAt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public String getDescribtion() {
        return describtion;
    }

    public void setDescribtion(String describtion) {
        this.describtion = describtion;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public User getUserid() {
        return userid;
    }

    public void setUserid(User userid) {
        this.userid = userid;
    }

    public SectionFactor getSectionFactorid() {
        return sectionFactorid;
    }

    public void setSectionFactorid(SectionFactor sectionFactorid) {
        this.sectionFactorid = sectionFactorid;
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
        if (!(object instanceof FactorField)) {
            return false;
        }
        FactorField other = (FactorField) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.FactorField[ id=" + id + " ]";
    }
    
}
