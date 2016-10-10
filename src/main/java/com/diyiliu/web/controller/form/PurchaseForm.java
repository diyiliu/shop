package com.diyiliu.web.controller.form;

import java.math.BigDecimal;
import java.util.List;

/**
 * Description: PurchaseForm
 * Author: DIYILIU
 * Update: 2016-09-30 13:38
 */

public class PurchaseForm {

    private String money;

    private List<String> idList;

    private List<Integer> countList;

    private List<BigDecimal> priceList;

    public List<String> getIdList() {
        return idList;
    }

    public void setIdList(List<String> idList) {
        this.idList = idList;
    }

    public List<Integer> getCountList() {
        return countList;
    }

    public void setCountList(List<Integer> countList) {
        this.countList = countList;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public List<BigDecimal> getPriceList() {
        return priceList;
    }

    public void setPriceList(List<BigDecimal> priceList) {
        this.priceList = priceList;
    }
}
