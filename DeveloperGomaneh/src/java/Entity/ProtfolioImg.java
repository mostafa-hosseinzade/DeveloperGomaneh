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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author administrator
 */
@Entity
@Table(name = "ProtfolioImg")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProtfolioImg.findAll", query = "SELECT p FROM ProtfolioImg p"),
    @NamedQuery(name = "ProtfolioImg.findById", query = "SELECT p FROM ProtfolioImg p WHERE p.id = :id"),
    @NamedQuery(name = "ProtfolioImg.findByCreatedAt", query = "SELECT p FROM ProtfolioImg p WHERE p.createdAt = :createdAt"),
    @NamedQuery(name = "ProtfolioImg.findByTitle", query = "SELECT p FROM ProtfolioImg p WHERE p.title = :title"),
    @NamedQuery(name = "ProtfolioImg.findByType", query = "SELECT p FROM ProtfolioImg p WHERE p.type = :type"),
    @NamedQuery(name = "ProtfolioImg.findByUpdatedAt", query = "SELECT p FROM ProtfolioImg p WHERE p.updatedAt = :updatedAt"),
    @NamedQuery(name = "ProtfolioImg.findByUrl", query = "SELECT p FROM ProtfolioImg p WHERE p.url = :url")})
public class ProtfolioImg implements Serializable {

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
    @Column(name = "title")
    private String title;
    @Column(name = "type")
    private Integer type;
    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    @Size(max = 255)
    @Column(name = "url")
    private String url;
    @JoinColumn(name = "Potfolio_id", referencedColumnName = "id")
    @ManyToOne
    private Portfolio potfolioid;

    public ProtfolioImg() {
    }

    public ProtfolioImg(Integer id) {
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Portfolio getPotfolioid() {
        return potfolioid;
    }

    public void setPotfolioid(Portfolio potfolioid) {
        this.potfolioid = potfolioid;
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
        if (!(object instanceof ProtfolioImg)) {
            return false;
        }
        ProtfolioImg other = (ProtfolioImg) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.ProtfolioImg[ id=" + id + " ]";
    }
    
}
