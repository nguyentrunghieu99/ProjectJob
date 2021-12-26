/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.nth.pojos;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Hieu
 */
@Entity
@Table(name = "job")
public class Job implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotNull(message = "name")
    private String name;
    @NotNull(message = "desc")
    private String description;
    private String requirement;
    private String reason;
    private String address;

    @Min(value = 100000, message = "{job.pay.minErr}")
    @Max(value = 100000000, message = "{job.pay.maxErr}")
    private BigDecimal pay;
//    private String image;
    @Column(name = "created_date")
    private Date createDate;
    private Boolean active;

//    @Transient
//    @NotNull(message = "file")
//    private MultipartFile file;

    @ManyToOne()
    @JoinColumn(name = "category_id")
    @NotNull(message = "{job.category.nullErr}")
    private Category category;


    @OneToMany(cascade = CascadeType.ALL, mappedBy = "job")
    private Collection<Comment> commentCollection;
    
    @ManyToOne()
    @JoinColumn(name= "location_id")
    private Location location;
    
    @ManyToOne()
    @JoinColumn(name = "user_id")
    private User user;
    

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

   

    /**
     * @return the createDate
     */
    /**
     * @return the active
     */
    public Boolean getActive() {
        return active;
    }

    /**
     * @param active the active to set
     */
    public void setActive(Boolean active) {
        this.active = active;
    }

    /**
     * @return the category
     */
    public Category getCategory() {
        return category;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(Category category) {
        this.category = category;
    }

 


    /**
     * @return the pay
     */
    public BigDecimal getPay() {
        return pay;
    }

    /**
     * @param pay the pay to set
     */
    public void setPay(BigDecimal pay) {
        this.pay = pay;
    }

    /**
     * @return the requirement
     */
    public String getRequirement() {
        return requirement;
    }

    /**
     * @param requirement the requirement to set
     */
    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    /**
     * @return the reason
     */
    public String getReason() {
        return reason;
    }

    /**
     * @param reason the reason to set
     */
    public void setReason(String reason) {
        this.reason = reason;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the createDate
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate the createDate to set
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return the commentCollection
     */
    public Collection<Comment> getCommentCollection() {
        return commentCollection;
    }

    /**
     * @param commentCollection the commentCollection to set
     */
    public void setCommentCollection(Collection<Comment> commentCollection) {
        this.commentCollection = commentCollection;}

    /**
     * @return the location
     */
    public Location getLocation() {
        return location;
    }

    /**
     * @param location the location to set
     */
    public void setLocation(Location location) {
        this.location = location;
    }

    /**
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     *  */
    public void setUser(User user) {
        this.user = user;
    }
   
    /**
     * @return the applications
     */
    
    
}
