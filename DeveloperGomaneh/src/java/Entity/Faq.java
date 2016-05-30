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
@Table(name = "Faq")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Faq.findAll", query = "SELECT f FROM Faq f"),
    @NamedQuery(name = "Faq.findById", query = "SELECT f FROM Faq f WHERE f.id = :id"),
    @NamedQuery(name = "Faq.findByAnswer", query = "SELECT f FROM Faq f WHERE f.answer = :answer"),
    @NamedQuery(name = "Faq.findByCreatedAt", query = "SELECT f FROM Faq f WHERE f.createdAt = :createdAt"),
    @NamedQuery(name = "Faq.findByEnable", query = "SELECT f FROM Faq f WHERE f.enable = :enable"),
    @NamedQuery(name = "Faq.findByFaq", query = "SELECT f FROM Faq f WHERE f.faq = :faq"),
    @NamedQuery(name = "Faq.findByMeta", query = "SELECT f FROM Faq f WHERE f.meta = :meta"),
    @NamedQuery(name = "Faq.findByOrderList", query = "SELECT f FROM Faq f WHERE f.orderList = :orderList"),
    @NamedQuery(name = "Faq.findBySlug", query = "SELECT f FROM Faq f WHERE f.slug = :slug"),
    @NamedQuery(name = "Faq.findByUpdatedAt", query = "SELECT f FROM Faq f WHERE f.updatedAt = :updatedAt"),
    @NamedQuery(name = "Faq.findByVisible", query = "SELECT f FROM Faq f WHERE f.visible = :visible")})
public class Faq implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Size(max = 255)
    @Column(name = "answer")
    private String answer;
    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    @Column(name = "enable")
    private Boolean enable;
    @Size(max = 255)
    @Column(name = "faq")
    private String faq;
    @Size(max = 255)
    @Column(name = "meta")
    private String meta;
    @Column(name = "order_list")
    private Integer orderList;
    @Size(max = 255)
    @Column(name = "slug")
    private String slug;
    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    @Column(name = "visible")
    private Boolean visible;
    @JoinColumn(name = "User_id", referencedColumnName = "id")
    @ManyToOne
    private User userid;

    public Faq() {
    }

    public Faq(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Boolean getEnable() {
        return enable;
    }

    public void setEnable(Boolean enable) {
        this.enable = enable;
    }

    public String getFaq() {
        return faq;
    }

    public void setFaq(String faq) {
        this.faq = faq;
    }

    public String getMeta() {
        return meta;
    }

    public void setMeta(String meta) {
        this.meta = meta;
    }

    public Integer getOrderList() {
        return orderList;
    }

    public void setOrderList(Integer orderList) {
        this.orderList = orderList;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Boolean getVisible() {
        return visible;
    }

    public void setVisible(Boolean visible) {
        this.visible = visible;
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
        if (!(object instanceof Faq)) {
            return false;
        }
        Faq other = (Faq) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Faq[ id=" + id + " ]";
    }
    
}
