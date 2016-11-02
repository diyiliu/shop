package com.diyiliu.console.entity;

import com.diyiliu.bll.bean.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Table;

/**
 * Description: SysResource
 * Author: DIYILIU
 * Update: 2016-10-24 16:03
 */

@Table(name = "SYS_RESOURCE", schema = "ID")
public class SysResource extends BaseEntity{

    @Column(name = "ID")
    private String id;

    @Column(name = "NAME")
    private String name;

    @Column(name = "TYPE")
    private String type;

    @Column(name = "URL")
    private String path;

    @Column(name = "PARENT_ID")
    private String pid;

    @Column(name = "PARENT_IDS")
    private String pids;

    @Column(name = "SORT")
    private Integer sort;

    @Column(name = "AVAILABLE")
    private boolean available;


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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPids() {
        return pids;
    }

    public void setPids(String pids) {
        this.pids = pids;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }
}
