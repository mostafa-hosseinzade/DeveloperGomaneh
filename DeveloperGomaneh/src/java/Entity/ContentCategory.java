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
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
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
@Table(name = "ContentCategory")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ContentCategory.findAll", query = "SELECT c FROM ContentCategory c"),
    @NamedQuery(name = "ContentCategory.findById", query = "SELECT c FROM ContentCategory c WHERE c.id = :id"),
    @NamedQuery(name = "ContentCategory.findByCreatedAt", query = "SELECT c FROM ContentCategory c WHERE c.createdAt = :createdAt"),
    @NamedQuery(name = "ContentCategory.findByDescribtion", query = "SELECT c FROM ContentCategory c WHERE c.describtion = :describtion"),
    @NamedQuery(name = "ContentCategory.findByEnable", query = "SELECT c FROM ContentCategory c WHERE c.enable = :enable"),
    @NamedQuery(name = "ContentCategory.findByMeta", query = "SELECT c FROM ContentCategory c WHERE c.meta = :meta"),
    @NamedQuery(name = "ContentCategory.findBySlug", query = "SELECT c FROM ContentCategory c WHERE c.slug = :slug"),
    @NamedQuery(name = "ContentCategory.findByTitle", query = "SELECT c FROM ContentCategory c WHERE c.title = :title"),
    @NamedQuery(name = "ContentCategory.findByUpdatedAt", query = "SELECT c FROM ContentCategory c WHERE c.updatedAt = :updatedAt"),
    @NamedQuery(name = "ContentCategory.findBySubctg", query = "SELECT c FROM ContentCategory c WHERE c.subctg = :subctg"),
    @NamedQuery(name = "ContentCategory.findByVisible", query = "SELECT c FROM ContentCategory c WHERE c.visible = :visible")})

public class ContentCategory implements Serializable {

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
    @Column(name = "enable")
    private Boolean enable;
    @Size(max = 255)
    @Column(name = "meta")
    private String meta;
    @Size(max = 255)
    @Column(name = "slug")
    private String slug;
    @Size(max = 255)
    @Column(name = "title")
    private String title;
    @Column(name = "updated_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    @Column(name = "visible")
    private Boolean visible;
    @OneToMany(mappedBy = "contentCategoryid")
    private Collection<Content> contentCollection;
    
    @OneToOne
    @JoinColumn(name="subctg",referencedColumnName = "id")
    private ContentCategory subctg;

    public ContentCategory getSubctg() {
        return subctg;
    }

    public void setSubctg(ContentCategory subctg) {
        this.subctg = subctg;
    }
    
    public ContentCategory() {
    }

    public ContentCategory(Integer id) {
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

    public Boolean getEnable() {
        return enable;
    }

    public void setEnable(Boolean enable) {
        this.enable = enable;
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

    public Boolean getVisible() {
        return visible;
    }

    public void setVisible(Boolean visible) {
        this.visible = visible;
    }

    @XmlTransient
    public Collection<Content> getContentCollection() {
        return contentCollection;
    }

    public void setContentCollection(Collection<Content> contentCollection) {
        this.contentCollection = contentCollection;
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
        if (!(object instanceof ContentCategory)) {
            return false;
        }
        ContentCategory other = (ContentCategory) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.ContentCategory[ id=" + id + " ]";
    }
    
    @PrePersist
    public void ChangeSlug(){
        String str = this.slug;
        str = str.replace(" ", "-");
        this.slug = str;
        this.createdAt = new Date();
    }
    
    @PreUpdate
    public void PreUpdate(){
        this.updatedAt = new Date();
    }
    
}
