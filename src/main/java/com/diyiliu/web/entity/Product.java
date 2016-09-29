package com.diyiliu.web.entity;

import com.diyiliu.bll.bean.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Description: Product
 * Author: DIYILIU
 * Update: 2016-09-27 11:00
 */

@Table(name = "PRODUCT", schema = "ID")
public class Product extends BaseEntity {

    @Column(name = "ID")
    private String id;

    @Column(name = "PRO_NAME")
    private String name;

    @Column(name = "PRO_PRICE")
    private BigDecimal price;

    @Column(name = "PRO_COUNT")
    private Integer count;

    @Column(name = "MODIFIED")
    private Date modified;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Date getModified() {
        return modified;
    }

    public void setModified(Date modified) {
        this.modified = modified;
    }
}
