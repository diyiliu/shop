package com.diyiliu.web.dao;

import com.diyiliu.bll.dao.BaseMapper;
import com.diyiliu.web.entity.Detail;

import java.util.List;

/**
 * Description: PurchaseDao
 * Author: DIYILIU
 * Update: 2016-10-10 11:58
 */

public interface PurchaseDao extends BaseMapper {

    List<Detail> queryDetails(String purId);
}
