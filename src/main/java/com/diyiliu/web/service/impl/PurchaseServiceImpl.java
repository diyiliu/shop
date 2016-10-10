package com.diyiliu.web.service.impl;

import com.diyiliu.bll.service.impl.BaseServiceImpl;
import com.diyiliu.web.dao.PurchaseDao;
import com.diyiliu.web.entity.Detail;
import com.diyiliu.web.service.PurchaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Description: PurchaseServiceImpl
 * Author: DIYILIU
 * Update: 2016-09-30 11:54
 */

@Service
public class PurchaseServiceImpl extends BaseServiceImpl implements PurchaseService {

    @Resource
    private PurchaseDao purchaseDao;

    @Override
    public List<Detail> queryDetails(String purId) {

        return purchaseDao.queryDetails(purId);
    }
}
