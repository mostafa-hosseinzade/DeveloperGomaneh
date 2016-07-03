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
@Table(name = "`Order`")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Order.findAll", query = "SELECT o FROM Order o"),
    @NamedQuery(name = "Order.findById", query = "SELECT o FROM Order o WHERE o.id = :id"),
    @NamedQuery(name = "Order.findByName", query = "SELECT o FROM Order o WHERE o.name = :name"),
    @NamedQuery(name = "Order.findByMobile", query = "SELECT o FROM Order o WHERE o.mobile = :mobile"),
    @NamedQuery(name = "Order.findByPhone", query = "SELECT o FROM Order o WHERE o.phone = :phone"),
    @NamedQuery(name = "Order.findByDesc", query = "SELECT o FROM Order o WHERE o.desc = :desc"),
    @NamedQuery(name = "Order.findByEmail", query = "SELECT o FROM Order o WHERE o.email = :email"),
    @NamedQuery(name = "Order.findByPersonal", query = "SELECT o FROM Order o WHERE o.personal = :personal"),
    @NamedQuery(name = "Order.findByCreatedAt", query = "SELECT o FROM Order o WHERE o.createdAt = :createdAt")})
public class Order implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255,message = "لطفا اطلاعات نام را درست وارد کنید")
    @Column(name = "`name`")
    private String name;
    @Size(max = 255,message = "لطفا اطلاعات موبایل را به درستی وارد کنید")
    @Column(name = "mobile")
    private String mobile;
    //@Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255,message = "لطفا اطلاعات تلفن را بدرستی وارد کنید")
    @Column(name = "`phone`")
    private String phone;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 4000,message = "لطفا توضیحات کلی در مورد سایت وارد کنید")
    @Column(name = "`desc`")
    private String desc;
    @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="لطفا ایمیل را به درستی وارد کنید")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255,message = "لطفا اطلاعات ایمیل را وارد کنید")
    @Column(name = "`email`")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Column(name = "`personal`")
    private boolean personal;
    @Basic(optional = false)
    @NotNull
    @Column(name = "`created_at`")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    @Column(name="`array_field`")
    private String arrayField;

    public String getArrayField() {
        return arrayField;
    }

    public void setArrayField(String arrayField) {
        this.arrayField = arrayField;
    }
    public Order() {
    }

    public Order(Integer id) {
        this.id = id;
    }

    public Order(Integer id, String name, String phone, String desc, String email, boolean personal, Date createdAt) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.desc = desc;
        this.email = email;
        this.personal = personal;
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

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean getPersonal() {
        return personal;
    }

    public void setPersonal(boolean personal) {
        this.personal = personal;
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
        if (!(object instanceof Order)) {
            return false;
        }
        Order other = (Order) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Order[ id=" + id + " ]";
    }
    
}
