/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import JsfClass.util.JsfUtil;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author administrator
 */
@Entity
@Table(name = "Contact")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Contact.findAll", query = "SELECT c FROM Contact c"),
    @NamedQuery(name = "Contact.findById", query = "SELECT c FROM Contact c WHERE c.id = :id"),
    @NamedQuery(name = "Contact.findByName", query = "SELECT c FROM Contact c WHERE c.name = :name"),
    @NamedQuery(name = "Contact.findByPhone", query = "SELECT c FROM Contact c WHERE c.phone = :phone"),
    @NamedQuery(name = "Contact.findByEmail", query = "SELECT c FROM Contact c WHERE c.email = :email"),
    @NamedQuery(name = "Contact.findByMessage", query = "SELECT c FROM Contact c WHERE c.message = :message"),
    @NamedQuery(name = "Contact.findByCreatedAt", query = "SELECT c FROM Contact c WHERE c.createdAt = :createdAt")})
public class Contact implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull(message = "فیلد نام نمی تواند خالی باشد")
    @Size(min = 2, max = 255,message = "فیلد نام نمی تواند خالی باشد")
    @Column(name = "name")
    private String name;
    @Pattern(regexp="^\\(?(\\d{4})\\)?[- ]?(\\d{3})[- ]?(\\d{2})[- ]?(\\d{2})$", message="تلفن همراه صحیح وارد نشده است")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull(message = "تلفن همراه نمی تواند خالی باشد")
    @Size(min = 1, max = 50,message = "طول کاراکتر تلفن همراه باید ۱۱ کاراکتر باشد")
    @Column(name = "phone")
    private String phone;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 255)
    @Column(name = "section")
    private String to="Developer";
    @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="آدرس ایمیل به درستی وارد نشده است")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull(message = "ایمیل نمی تواند خالی باشد")
    @Size(min = 10, max = 255,message = "طول کارکتر ایمیل باید از ۱۰ به بالا باشد")
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @NotNull(message = "لطفا پیام خود را وارد کنید")
    @Size(min = 10, max = 1000,message = "طول کاراکتر  پیام باید بین ۱۰ الی ۱۰۰۰ باشد")
    @Column(name = "message")
    private String message;
    @Basic(optional = false)
    @NotNull
    @Column(name = "created_at")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    public Contact() {
    }

    public Contact(Integer id) {
        this.id = id;
    }

    public Contact(Integer id, String name, String phone, String to, String email, String message, Date createdAt) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.to = to;
        this.email = email;
        this.message = message;
        this.createdAt = createdAt;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
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
        if (!(object instanceof Contact)) {
            return false;
        }
        Contact other = (Contact) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Contact[ id=" + id + " ]";
    }
    @PrePersist
    public void beforeCreate(){
        this.createdAt = new Date();
    }
}
