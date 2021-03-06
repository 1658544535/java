/*
 * Copyright(c) 2016 cncounter.com All rights reserved.
 * distributed with this file and available online at
 * http://b2c.taozhuma.com/
 */
package com.tzmb2c.web.service;

import java.util.List;
import java.util.Map;


import com.tzmb2c.web.pojo.UserBabyPojo;

/**
 * @version 1.0
 * @author 
 */
public interface UserBabyService {
	
	public int add(UserBabyPojo userBaby);

	public int update(UserBabyPojo userBaby);
    
	public int delete(Long id);

	public UserBabyPojo getById(Long id);

	public Integer countBy(Map<String, Object> params);

	public List<UserBabyPojo> listPage(Map<String, Object> params);
	
	/**
	 * 查询一条记录
	 * @param params
	 * @return
	 */
	public UserBabyPojo getByParams(Map<String, Object> params);

}
