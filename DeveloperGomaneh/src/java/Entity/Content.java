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
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.PrePersist;
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
@Table(name = "Content")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Content.findAll", query = "SELECT c FROM Content c"),
    @NamedQuery(name = "Content.findById", query = "SELECT c FROM Content c WHERE c.id = :id"),
    @NamedQuery(name = "Content.findByCreatedAt", query = "SELECT c FROM Content c WHERE c.createdAt = :createdAt"),
    @NamedQuery(name = "Content.findByMeta", query = "SELECT c FROM Content c WHERE c.meta = :meta"),
    @NamedQuery(name = "Content.findByOrderList", query = "SELECT c FROM Content c WHERE c.orderList = :orderList"),
    @NamedQuery(name = "Content.findBySlug", query = "SELECT c FROM Content c WHERE c.slug = :slug"),
    @NamedQuery(name = "Content.findByTitle", query = "SELECT c FROM Content c WHERE c.title = :title"),
    @NamedQuery(name = "Content.findByUpdatedAt", query = "SELECT c FROM Content c WHERE c.updatedAt = :updatedAt")})
public class Content implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Lob
    @Size(max = 2147483647)
    @Column(name = "content")
    private String content;
    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    @Size(max = 255)
    @Column(name = "meta")
    private String meta;
    @Column(name = "order_list")
    private Integer orderList;
    @Size(max = 255)
    @Column(name = "slug")
    private String slug;
    @Size(max = 255)
    @Column(name = "title")
    private String title;
    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    @JoinColumn(name = "ContentCategory_id", referencedColumnName = "id")
    @ManyToOne
    private ContentCategory contentCategoryid;
    @JoinColumn(name = "User_id", referencedColumnName = "id")
    @ManyToOne
    private User userid;

    public Content() {
    }

    public Content(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
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

    public ContentCategory getContentCategoryid() {
        return contentCategoryid;
    }

    public void setContentCategoryid(ContentCategory contentCategoryid) {
        this.contentCategoryid = contentCategoryid;
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
        if (!(object instanceof Content)) {
            return false;
        }
        Content other = (Content) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Content[ id=" + id + " ]";
    }
    
    @PrePersist
    public void prep(){
        this.createdAt = new Date();
    }
    
}
