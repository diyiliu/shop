package com.diyiliu.web.service;

import com.diyiliu.bll.service.BaseService;
import com.diyiliu.web.entity.Detail;

import java.util.List;

/**
 * Description: PurchaseService
 * Author: DIYILIU
 * Update: 2016-09-30 11:53
 */

public interface PurchaseService extends BaseService {

    List<Detail> queryDetails(String purId);
}
