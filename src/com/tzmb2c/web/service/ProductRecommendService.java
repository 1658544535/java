/*
 * Copyright(c) 2016 cncounter.com All rights reserved.
 * distributed with this file and available online at
 * http://b2c.taozhuma.com/
 */
package com.tzmb2c.web.service;

import java.util.List;
import java.util.Map;


import com.tzmb2c.web.pojo.ProductRecommendPojo;

/**
 * @version 1.0
 * @author 
 */
public interface ProductRecommendService {
	
	public int add(ProductRecommendPojo productRecommend);

	public int update(ProductRecommendPojo productRecommend);
    
	public int delete(Long id);

	public ProductRecommendPojo getById(Long id);

	public Integer countBy(Map<String, Object> params);

	public List<ProductRecommendPojo> listPage(Map<String, Object> params);

}
