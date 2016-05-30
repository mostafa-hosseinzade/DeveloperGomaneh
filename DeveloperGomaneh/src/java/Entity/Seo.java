/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
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
@Table(name = "Seo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Seo.findAll", query = "SELECT s FROM Seo s"),
    @NamedQuery(name = "Seo.findById", query = "SELECT s FROM Seo s WHERE s.id = :id"),
    @NamedQuery(name = "Seo.findByCreatedAt", query = "SELECT s FROM Seo s WHERE s.createdAt = :createdAt"),
    @NamedQuery(name = "Seo.findByMeta", query = "SELECT s FROM Seo s WHERE s.meta = :meta"),
    @NamedQuery(name = "Seo.findByPrice", query = "SELECT s FROM Seo s WHERE s.price = :price"),
    @NamedQuery(name = "Seo.findBySlug", query = "SELECT s FROM Seo s WHERE s.slug = :slug"),
    @NamedQuery(name = "Seo.findByTitle", query = "SELECT s FROM Seo s WHERE s.title = :title"),
    @NamedQuery(name = "Seo.findByUpdatedAt", query = "SELECT s FROM Seo s WHERE s.updatedAt = :updatedAt")})
public class Seo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "describtion")
    private String describtion;
    @Size(max = 255)
    @Column(name = "meta")
    private String meta;
    @Column(name = "price")
    private BigInteger price;
    @Size(max = 255)
    @Column(name = "slug")
    private String slug;
    @Size(max = 255)
    @Column(name = "title")
    private String title;
    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    @JoinColumn(name = "User_id", referencedColumnName = "id")
    @ManyToOne
    private User userid;

    public Seo() {
    }

    public Seo(Integer id) {
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

    public BigInteger getPrice() {
        return price;
    }

    public void setPrice(BigInteger price) {
        this.price = price;
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

    public User getUserid() {
        return userid;
    }

    public void setUserid(User userid) {
        this.userid = userid;
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
        if (!(object instanceof Seo)) {
            return false;
        }
        Seo other = (Seo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Seo[ id=" + id + " ]";
    }
    
}
