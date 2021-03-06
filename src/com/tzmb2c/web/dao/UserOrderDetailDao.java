package com.tzmb2c.web.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.tzmb2c.web.pojo.UserOrderDetailPojo;

public interface UserOrderDetailDao {

  public int userOrderDetailAllCount(Map<String, Object> map);

  public List<UserOrderDetailPojo> userOrderDetailAllList(Map<String, Object> map);

  public int productSaleCountAllCount(Map<String, Object> map);

  public List<UserOrderDetailPojo> productSaleCountAllList(Map<String, Object> map);

  public void addUserOrderDetail(UserOrderDetailPojo userOrderDetailPojo) throws SQLException;

  public void delUserOrderDetail(UserOrderDetailPojo userOrderDetailPojo) throws SQLException;

  public void delAllUserOrderDetailById(String id) throws SQLException;

  public UserOrderDetailPojo findUserOrderDetailById(Long id) throws SQLException;

  public void updateUserOrderDetail(UserOrderDetailPojo userOrderDetailPojo) throws SQLException;

  public void checkUserOrderDetail(UserOrderDetailPojo userOrderDetailPojo) throws SQLException;

  public void checkAllUserOrderDetailById(String id) throws SQLException;

  public int shopSaleListCount(Map<String, Object> map);

  public List<UserOrderDetailPojo> shopSaleList(Map<String, Object> map);

  public int sellSumNum(Long productId) throws SQLException;
}
