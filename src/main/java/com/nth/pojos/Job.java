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
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

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

    private String name;
    private String description;
    
    @NotEmpty(message = "{job.notnull.requirement}")
    private String requirement;
    @NotEmpty(message = "{job.notnull.reason}")
    private String reason;
    @NotEmpty(message = "{job.notnull.address}")
    private String address;

    @Min(value = 3, message = "{job.pay.minErr}")
    @Max(value = 500, message = "{job.pay.maxErr}")
    private int pay;
    @Column(name = "created_date")
    private Date createDate;
    @Min(value = 1, message = "{job.quantily}")
    private int quantily;
    @NotEmpty(message = "{job.notnull.timework}")
    private String timework;
    private String level;
    private String experience;
    private String gender;

    @ManyToOne()
    @JoinColumn(name = "category_id")
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
    public int getPay() {
        return pay;
    }

    /**
     * @param pay the pay to set
     */
    public void setPay(int pay) {
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
     * @return the timework
     */
    public String getTimework() {
        return timework;
    }

    /**
     * @return the level
     */
    public String getLevel() {
        return level;
    }

    /**
     * @return the experience
     */
    public String getExperience() {
        return experience;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @return the quanlity
     */
    public int getQuantily() {
        return quantily;
    }

    /**
     * @param quanlity the quanlity to set
     */
    public void setQuantily(int quanlity) {
        this.quantily = quanlity;
    }

    /**
     * @param timework the timework to set
     */
    public void setTimework(String timework) {
        this.timework = timework;
    }

    /**
     * @param level the level to set
     */
    public void setLevel(String level) {
        this.level = level;
    }

    /**
     * @param experience the experience to set
     */
    public void setExperience(String experience) {
        this.experience = experience;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }
   
    /**
     * @return the applications
     */
    
    
}
