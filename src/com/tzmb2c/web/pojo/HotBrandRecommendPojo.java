/*
 * Copyright(c) 2016 cncounter.com All rights reserved. distributed with this file and available
 * online at http://b2c.taozhuma.com/
 */
package com.tzmb2c.web.pojo;

import java.util.Date;

import maowu.framework.utils.pojo.SuperPojo;

import com.tzmb2c.utils.StringUtil;

/**
 * 热门品牌表; InnoDB free: 186368 kB
 * 
 * @version 1.0
 * @author
 */
public class HotBrandRecommendPojo extends SuperPojo {

  /**
   * ID
   */
  private Long id;
  /**
   * user_brand表对应ID
   */
  private Long brandId;
  /**
   * 排序序号
   */
  private Integer sorting;
  /**
   * 品牌图标
   */
  private String image;
  /**
   * 品牌名称
   */
  private String name;
  private String createDateStr;
  private String updateDateStr;

  @Override
  public Date getCreateDate() {
    return createDate;
  }

  @Override
  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
    setCreateDateStr(StringUtil.dateString(this.createDate));
  }

  @Override
  public Date getUpdateDate() {
    return updateDate;
  }

  @Override
  public void setUpdateDate(Date updateDate) {
    this.updateDate = updateDate;
    setUpdateDateStr(StringUtil.dateString(this.updateDate));
  }

  public String getImage() {
    return image;
  }

  public void setImage(String image) {
    this.image = image;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setId(Long value) {
    this.id = value;
  }

  public Long getId() {
    return this.id;
  }

  public void setBrandId(Long value) {
    this.brandId = value;
  }

  public Long getBrandId() {
    return this.brandId;
  }

  public void setSorting(Integer value) {
    this.sorting = value;
  }

  public Integer getSorting() {
    return this.sorting;
  }

  public String getCreateDateStr() {
    return createDateStr;
  }

  public void setCreateDateStr(String createDateStr) {
    this.createDateStr = createDateStr;
  }

  public String getUpdateDateStr() {
    return updateDateStr;
  }

  public void setUpdateDateStr(String updateDateStr) {
    this.updateDateStr = updateDateStr;
  }


}
