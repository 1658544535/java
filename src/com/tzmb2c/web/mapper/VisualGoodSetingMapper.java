package com.tzmb2c.web.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.tzmb2c.web.pojo.SpecialProductPojo;

public interface VisualGoodSetingMapper {
  List<SpecialProductPojo> findVisualGoodSetingList(Map<String, Object> map) throws SQLException;

  int findVisualGoodSetingCount(Map<String, Object> map) throws SQLException;

  void setSpecialProduct(Long id) throws SQLException;

  void unsetSpecialProduct(Long id) throws SQLException;
}
