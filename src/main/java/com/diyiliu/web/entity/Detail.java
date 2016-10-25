package com.diyiliu.web.entity;

import com.diyiliu.bll.bean.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * Description: Detail
 * Author: DIYILIU
 * Update: 2016-09-30 11:47
 */

@Table(name = "BS_DETAIL", schema = "ID")
public class Detail extends BaseEntity {

    @Column(name = "ID")
    private String id;

    @Column(name = "PUR_ID")
    private String purId;

    @Column(name = "PRO_ID")
    private String proId;

    @Column(name = "PRO_COUNT")
    private Integer proCount;

    @Column(name = "PRO_PRICE")
    private BigDecimal proPrice;

    private Product product;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPurId() {
        return purId;
    }

    public void setPurId(String purId) {
        this.purId = purId;
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public Integer getProCount() {
        return proCount;
    }

    public void setProCount(Integer proCount) {
        this.proCount = proCount;
    }

    public BigDecimal getProPrice() {
        return proPrice;
    }

    public void setProPrice(BigDecimal proPrice) {
        this.proPrice = proPrice;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
