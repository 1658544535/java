package com.tzmb2c.web.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.tzmb2c.web.pojo.AgencyCollectPojo;

public interface AgencyCollectDao {

  void insertAgencyCollect(AgencyCollectPojo agencyCollectPojo) throws SQLException;

  AgencyCollectPojo findagencyCollectById(AgencyCollectPojo agencyCollectPojo) throws SQLException;

  List<AgencyCollectPojo> findagencyCollectByUid(Map<String, Object> map);

  void updatAagencyNumWeb(AgencyCollectPojo agencyCollectPojo) throws SQLException;

  void delNotCheckProduct(Map<String, Object> map) throws SQLException;

  /**
   * 删除代理产品
   * 
   * @param map
   * @throws SQLException
   */
  void delCheckProduct(AgencyCollectPojo agencyCollectPojo) throws SQLException;

  int agencyCollectCount(Map<String, Object> map) throws SQLException;

  List<AgencyCollectPojo> agencyCollectList(Map<String, Object> map) throws SQLException;

  void updatAagencyCollect(AgencyCollectPojo agencyCollectPojo) throws SQLException;

  void delAgencyCollectById(Long id) throws SQLException;

  Long findagencyCollectByProductId(Map<String, Object> map) throws SQLException;
}
