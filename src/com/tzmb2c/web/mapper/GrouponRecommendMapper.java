/*
 * 文 件 名:  GrouponRecommendMapper.java
 * 创 建 人:  admin
 * 创建时间:  2016-09-26
 */
package com.tzmb2c.web.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.tzmb2c.web.pojo.GrouponRecommendPojo;

public interface GrouponRecommendMapper {

  GrouponRecommendPojo getById(Long id) throws SQLException;

  int countBy(Map<String, Object> params) throws SQLException;

  List<GrouponRecommendPojo> listPage(Map<String, Object> params) throws SQLException;

  int insert(GrouponRecommendPojo grouponRecommend) throws SQLException;

  int update(GrouponRecommendPojo grouponRecommend) throws SQLException;

  int deleteById(Long id) throws SQLException;
}
