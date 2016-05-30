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
@Table(name = "Factor")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Factor.findAll", query = "SELECT f FROM Factor f"),
    @NamedQuery(name = "Factor.findById", query = "SELECT f FROM Factor f WHERE f.id = :id"),
    @NamedQuery(name = "Factor.findByArrayFactorField", query = "SELECT f FROM Factor f WHERE f.arrayFactorField = :arrayFactorField"),
    @NamedQuery(name = "Factor.findByCreatedAt", query = "SELECT f FROM Factor f WHERE f.createdAt = :createdAt"),
    @NamedQuery(name = "Factor.findByDate", query = "SELECT f FROM Factor f WHERE f.date = :date"),
    @NamedQuery(name = "Factor.findByIpClient", query = "SELECT f FROM Factor f WHERE f.ipClient = :ipClient"),
    @NamedQuery(name = "Factor.findByTotal", query = "SELECT f FROM Factor f WHERE f.total = :total")})
public class Factor implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 255)
    @Column(name = "ArrayFactorField")
    private String arrayFactorField;
    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    @Column(name = "date")
    @Temporal(TemporalType.DATE)
    private Date date;
    @Size(max = 255)
    @Column(name = "ip_client")
    private String ipClient;
    @Column(name = "total")
    private BigInteger total;
    @JoinColumn(name = "User_id", referencedColumnName = "id")
    @ManyToOne
    private User userid;

    public Factor() {
    }

    public Factor(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getArrayFactorField() {
        return arrayFactorField;
    }

    public void setArrayFactorField(String arrayFactorField) {
        this.arrayFactorField = arrayFactorField;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getIpClient() {
        return ipClient;
    }

    public void setIpClient(String ipClient) {
        this.ipClient = ipClient;
    }

    public BigInteger getTotal() {
        return total;
    }

    public void setTotal(BigInteger total) {
        this.total = total;
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
        if (!(object instanceof Factor)) {
            return false;
        }
        Factor other = (Factor) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Factor[ id=" + id + " ]";
    }
    
}
