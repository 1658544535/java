/*
 * Copyright(c) 2016 cncounter.com All rights reserved.
 * distributed with this file and available online at
 * http://b2c.taozhuma.com/
 */
package com.tzmb2c.web.service;

import java.util.List;
import java.util.Map;


import com.tzmb2c.web.pojo.CategoryDetailSettingPojo;

/**
 * @version 1.0
 * @author 
 */
public interface CategoryDetailSettingService {
	
	public int add(CategoryDetailSettingPojo categoryDetailSetting);

	public int update(CategoryDetailSettingPojo categoryDetailSetting);
    
	public int delete(Long id);

	public CategoryDetailSettingPojo getById(Long id);

	public Integer countBy(Map<String, Object> params);

	public List<CategoryDetailSettingPojo> listPage(Map<String, Object> params);

}
